<script lang="ts">
	import { spring } from 'svelte/motion';

	type Mode = 'number' | 'coin' | 'list';

	let mode: Mode = $state('number');
	let min = $state(1);
	let max = $state(100);
	let result: string | null = $state(null);
	let generating = $state(false);
	let listInput = $state('Red, Blue, Green, Yellow, Purple');
	let history: { value: string; mode: Mode; id: number }[] = $state([]);
	let nextId = $state(0);

	const resultScale = spring(1, { stiffness: 0.3, damping: 0.5 });

	let displayValue = $state('');
	let animFrame: ReturnType<typeof setTimeout> | null = null;

	function generateNumber() {
		if (generating) return;
		generating = true;
		result = null;
		resultScale.set(0.7);

		const lo = Math.min(min, max);
		const hi = Math.max(min, max);
		let ticks = 0;
		const maxTicks = 12;

		function tick() {
			displayValue = String(Math.floor(Math.random() * (hi - lo + 1)) + lo);
			ticks++;
			if (ticks < maxTicks) {
				animFrame = setTimeout(tick, 30 + ticks * 15);
			} else {
				const final = String(Math.floor(Math.random() * (hi - lo + 1)) + lo);
				displayValue = final;
				result = final;
				generating = false;
				resultScale.set(1);
				history = [{ value: final, mode: 'number', id: nextId++ }, ...history.slice(0, 19)];
			}
		}
		tick();
	}

	function flipCoin() {
		if (generating) return;
		generating = true;
		result = null;
		resultScale.set(0.7);

		let ticks = 0;
		const maxTicks = 10;

		function tick() {
			displayValue = Math.random() > 0.5 ? 'Heads' : 'Tails';
			ticks++;
			if (ticks < maxTicks) {
				animFrame = setTimeout(tick, 50 + ticks * 20);
			} else {
				const final = Math.random() > 0.5 ? 'Heads' : 'Tails';
				displayValue = final;
				result = final;
				generating = false;
				resultScale.set(1);
				history = [{ value: final, mode: 'coin', id: nextId++ }, ...history.slice(0, 19)];
			}
		}
		tick();
	}

	function pickFromList() {
		if (generating) return;
		const items = listInput.split(',').map((s) => s.trim()).filter(Boolean);
		if (items.length === 0) return;

		generating = true;
		result = null;
		resultScale.set(0.7);

		let ticks = 0;
		const maxTicks = 14;

		function tick() {
			displayValue = items[Math.floor(Math.random() * items.length)];
			ticks++;
			if (ticks < maxTicks) {
				animFrame = setTimeout(tick, 40 + ticks * 15);
			} else {
				const final = items[Math.floor(Math.random() * items.length)];
				displayValue = final;
				result = final;
				generating = false;
				resultScale.set(1);
				history = [{ value: final, mode: 'list', id: nextId++ }, ...history.slice(0, 19)];
			}
		}
		tick();
	}

	function generate() {
		if (mode === 'number') generateNumber();
		else if (mode === 'coin') flipCoin();
		else pickFromList();
	}

	const modes: { key: Mode; label: string; icon: string }[] = [
		{ key: 'number', label: 'Number', icon: '#' },
		{ key: 'coin', label: 'Coin', icon: '○' },
		{ key: 'list', label: 'List', icon: '≡' },
	];

	let modeLabel = $derived(modes.find((m) => m.key === mode)?.icon ?? '#');
</script>

<svelte:window onkeydown={(e) => { if (e.code === 'Space') { e.preventDefault(); generate(); } }} />

<div class="flex flex-col items-center gap-8">
	<h2 class="font-mono text-sm font-bold tracking-widest text-text-muted uppercase">Random Generator</h2>

	<!-- Mode selector -->
	<div class="flex gap-2">
		{#each modes as m (m.key)}
			<button
				onclick={() => { mode = m.key; result = null; }}
				class={[
					'rounded-lg border px-4 py-2 font-mono text-sm font-bold transition-all',
					mode === m.key
						? 'border-accent-cool bg-accent-cool/15 text-accent-cool shadow-glow-blue'
						: 'border-border bg-surface text-text-muted hover:border-accent-cool/50 hover:text-text'
				]}
			>
				<span class="mr-1.5">{m.icon}</span>{m.label}
			</button>
		{/each}
	</div>

	<!-- Mode-specific controls -->
	<div class="flex items-center gap-3">
		{#if mode === 'number'}
			<label class="flex items-center gap-2">
				<span class="font-mono text-xs text-text-muted">Min</span>
				<input
					type="number"
					bind:value={min}
					class="w-24 rounded-lg border border-border bg-surface px-3 py-2 font-mono text-sm text-text focus:border-accent-cool focus:outline-none"
				/>
			</label>
			<span class="text-text-muted">—</span>
			<label class="flex items-center gap-2">
				<span class="font-mono text-xs text-text-muted">Max</span>
				<input
					type="number"
					bind:value={max}
					class="w-24 rounded-lg border border-border bg-surface px-3 py-2 font-mono text-sm text-text focus:border-accent-cool focus:outline-none"
				/>
			</label>
		{:else if mode === 'list'}
			<label class="flex flex-col gap-1">
				<span class="font-mono text-xs text-text-muted">Comma-separated items</span>
				<input
					type="text"
					bind:value={listInput}
					class="w-80 rounded-lg border border-border bg-surface px-3 py-2 font-mono text-sm text-text focus:border-accent-cool focus:outline-none"
				/>
			</label>
		{:else}
			<span class="font-mono text-sm text-text-muted">Heads or Tails</span>
		{/if}
	</div>

	<!-- Result display -->
	<button
		onclick={generate}
		disabled={generating}
		class="group relative flex h-40 w-64 cursor-pointer items-center justify-center rounded-2xl border-2 border-border bg-surface transition-colors hover:border-accent-cool focus:outline-none focus-visible:ring-2 focus-visible:ring-accent-cool"
		style:transform="scale({$resultScale})"
	>
		<span class="absolute -top-3 rounded-md bg-bg px-2 font-mono text-xs text-text-muted">{modeLabel}</span>
		{#if result !== null || generating}
			<span class="font-mono text-5xl font-black text-text">{displayValue}</span>
		{:else}
			<span class="font-mono text-lg text-text-muted">tap to generate</span>
		{/if}
	</button>

	<p class="font-mono text-xs text-text-muted">spacebar or tap</p>

	<!-- History -->
	{#if history.length > 0}
		<div class="w-full max-w-md">
			<h3 class="mb-3 font-mono text-xs font-bold tracking-widest text-text-muted uppercase">History</h3>
			<div class="flex flex-wrap gap-2">
				{#each history as h (h.id)}
					<div class="flex items-center gap-1.5 rounded-md border border-border bg-surface-2 px-2.5 py-1 font-mono text-xs text-text-muted animate-number-pop">
						<span class="text-accent-cool">{h.mode === 'number' ? '#' : h.mode === 'coin' ? '○' : '≡'}</span>
						<span class="font-bold text-text">{h.value}</span>
					</div>
				{/each}
			</div>
		</div>
	{/if}
</div>
