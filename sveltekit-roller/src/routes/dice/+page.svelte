<script lang="ts">
	import { spring } from 'svelte/motion';

	const DICE = [4, 6, 8, 10, 12, 20] as const;
	type DiceType = (typeof DICE)[number];

	let selected: DiceType = $state(20);
	let result: number | null = $state(null);
	let rolling = $state(false);
	let history: { sides: DiceType; value: number; id: number }[] = $state([]);
	let nextId = $state(0);

	const scale = spring(1, { stiffness: 0.3, damping: 0.6 });
	const rotation = spring(0, { stiffness: 0.15, damping: 0.4 });

	let displayValue = $state(0);
	let animFrame: ReturnType<typeof setTimeout> | null = null;

	function roll() {
		if (rolling) return;
		rolling = true;
		result = null;
		scale.set(0.8);
		rotation.set($rotation + 720);

		let ticks = 0;
		const maxTicks = 15;

		function tick() {
			displayValue = Math.floor(Math.random() * selected) + 1;
			ticks++;
			if (ticks < maxTicks) {
				animFrame = setTimeout(tick, 40 + ticks * 12);
			} else {
				const final = Math.floor(Math.random() * selected) + 1;
				displayValue = final;
				result = final;
				rolling = false;
				scale.set(1);
				history = [{ sides: selected, value: final, id: nextId++ }, ...history.slice(0, 19)];
			}
		}
		tick();
	}

	function selectDice(d: DiceType) {
		selected = d;
		result = null;
	}

	let isCrit = $derived(result === selected);
	let isMin = $derived(result === 1);
</script>

<svelte:window onkeydown={(e) => { if (e.code === 'Space') { e.preventDefault(); roll(); } }} />

<div class="flex flex-col items-center gap-8">
	<h2 class="font-mono text-sm font-bold tracking-widest text-text-muted uppercase">Dice Roller</h2>

	<!-- Dice selector -->
	<div class="flex gap-2">
		{#each DICE as d (d)}
			<button
				onclick={() => selectDice(d)}
				class={[
					'rounded-lg border px-4 py-2 font-mono text-sm font-bold transition-all',
					selected === d
						? 'border-accent bg-accent/15 text-accent shadow-glow-green'
						: 'border-border bg-surface text-text-muted hover:border-accent/50 hover:text-text'
				]}
			>
				D{d}
			</button>
		{/each}
	</div>

	<!-- Roll display -->
	<button
		onclick={roll}
		disabled={rolling}
		class="group relative flex h-48 w-48 cursor-pointer items-center justify-center rounded-2xl border-2 border-border bg-surface transition-colors hover:border-accent focus:outline-none focus-visible:ring-2 focus-visible:ring-accent"
		style:transform="scale({$scale}) rotate({$rotation}deg)"
	>
		<span class="absolute -top-3 rounded-md bg-bg px-2 font-mono text-xs text-text-muted">D{selected}</span>
		{#if result !== null || rolling}
			<span
				class={[
					'font-mono text-6xl font-black transition-colors',
					isCrit ? 'text-accent' : isMin ? 'text-accent-hot' : 'text-text'
				]}
			>
				{displayValue}
			</span>
		{:else}
			<span class="font-mono text-lg text-text-muted">tap to roll</span>
		{/if}
		{#if isCrit}
			<span class="absolute -bottom-3 rounded-md bg-accent/20 px-2 font-mono text-xs font-bold text-accent">CRIT!</span>
		{/if}
		{#if isMin}
			<span class="absolute -bottom-3 rounded-md bg-accent-hot/20 px-2 font-mono text-xs font-bold text-accent-hot">NAT 1</span>
		{/if}
	</button>

	<p class="font-mono text-xs text-text-muted">spacebar or tap</p>

	<!-- History -->
	{#if history.length > 0}
		<div class="w-full max-w-md">
			<h3 class="mb-3 font-mono text-xs font-bold tracking-widest text-text-muted uppercase">History</h3>
			<div class="flex flex-wrap gap-2">
				{#each history as h (h.id)}
					<div
						class={[
							'flex items-center gap-1.5 rounded-md border px-2.5 py-1 font-mono text-xs animate-number-pop',
							h.value === h.sides ? 'border-accent/40 bg-accent/10 text-accent' :
							h.value === 1 ? 'border-accent-hot/40 bg-accent-hot/10 text-accent-hot' :
							'border-border bg-surface-2 text-text-muted'
						]}
					>
						<span class="text-text-muted">D{h.sides}</span>
						<span class="font-bold">{h.value}</span>
					</div>
				{/each}
			</div>
		</div>
	{/if}
</div>
