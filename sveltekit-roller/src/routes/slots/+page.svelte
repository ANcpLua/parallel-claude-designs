<script lang="ts">
	const SYMBOLS = ['7', '🍒', '🔔', '💎', '🍋', '⭐', '🍊', '🎲'] as const;
	const REEL_COUNT = 3;

	let reels: string[] = $state(Array(REEL_COUNT).fill('?'));
	let spinning: boolean[] = $state(Array(REEL_COUNT).fill(false));
	let isSpinning = $derived(spinning.some(Boolean));
	let spinDisplays: string[][] = $state(Array.from({ length: REEL_COUNT }, () => [...SYMBOLS]));
	let history: { reels: string[]; win: boolean; id: number }[] = $state([]);
	let nextId = $state(0);
	let timers: ReturnType<typeof setInterval>[] = $state([]);

	function randomSymbol(): string {
		return SYMBOLS[Math.floor(Math.random() * SYMBOLS.length)];
	}

	function spin() {
		if (isSpinning) return;

		spinning = Array(REEL_COUNT).fill(true);
		reels = Array(REEL_COUNT).fill('?');

		// Clear old timers
		timers.forEach(clearInterval);
		timers = [];

		// Spin each reel with cascading stop
		for (let i = 0; i < REEL_COUNT; i++) {
			const interval = setInterval(() => {
				spinDisplays[i] = [...spinDisplays[i].slice(1), randomSymbol()];
			}, 60);
			timers[i] = interval;

			setTimeout(() => {
				clearInterval(timers[i]);
				const final = randomSymbol();
				reels[i] = final;
				spinDisplays[i] = [SYMBOLS[(SYMBOLS.indexOf(final as typeof SYMBOLS[number]) + SYMBOLS.length - 1) % SYMBOLS.length], final, randomSymbol()];
				spinning[i] = false;

				// All stopped?
				if (i === REEL_COUNT - 1) {
					const isWin = reels[0] === reels[1] && reels[1] === reels[2];
					history = [{ reels: [...reels], win: isWin, id: nextId++ }, ...history.slice(0, 14)];
				}
			}, 800 + i * 500);
		}
	}

	let allMatch = $derived(!isSpinning && reels[0] !== '?' && reels[0] === reels[1] && reels[1] === reels[2]);
	let twoMatch = $derived(!isSpinning && reels[0] !== '?' && !allMatch && (reels[0] === reels[1] || reels[1] === reels[2] || reels[0] === reels[2]));
</script>

<svelte:window onkeydown={(e) => { if (e.code === 'Space') { e.preventDefault(); spin(); } }} />

<div class="flex flex-col items-center gap-8">
	<h2 class="font-mono text-sm font-bold tracking-widest text-text-muted uppercase">Slot Machine</h2>

	<!-- Reels -->
	<div class="flex items-center gap-3">
		{#each reels as reel, i (i)}
			<div
				class={[
					'relative flex h-28 w-24 items-center justify-center overflow-hidden rounded-xl border-2 bg-surface font-mono text-4xl transition-all',
					spinning[i] ? 'border-accent-warm/50' :
					allMatch ? 'border-accent shadow-glow-green' :
					'border-border'
				]}
			>
				{#if spinning[i]}
					<div class="flex flex-col items-center animate-slot-spin">
						{#each spinDisplays[i] as sym}
							<span class="flex h-28 items-center justify-center">{sym}</span>
						{/each}
					</div>
				{:else}
					<span class={['transition-all', reel !== '?' ? 'animate-number-pop' : ''].join(' ')}>
						{reel}
					</span>
				{/if}
			</div>
		{/each}
	</div>

	<!-- Result indicator -->
	<div class="h-8 flex items-center">
		{#if allMatch}
			<span class="animate-number-pop rounded-lg bg-accent/15 px-4 py-1 font-mono text-sm font-bold text-accent shadow-glow-green">
				JACKPOT!
			</span>
		{:else if twoMatch}
			<span class="animate-number-pop rounded-lg bg-accent-warm/15 px-4 py-1 font-mono text-sm font-bold text-accent-warm">
				2 of a kind
			</span>
		{/if}
	</div>

	<!-- Spin button -->
	<button
		onclick={spin}
		disabled={isSpinning}
		class={[
			'rounded-xl border-2 px-10 py-3 font-mono text-sm font-bold tracking-wider uppercase transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-accent',
			isSpinning
				? 'cursor-not-allowed border-border bg-surface text-text-muted'
				: 'border-accent-warm bg-accent-warm/10 text-accent-warm hover:bg-accent-warm/20 hover:shadow-glow-orange'
		]}
	>
		{isSpinning ? 'Spinning...' : 'Spin'}
	</button>

	<p class="font-mono text-xs text-text-muted">spacebar or tap</p>

	<!-- History -->
	{#if history.length > 0}
		<div class="w-full max-w-md">
			<h3 class="mb-3 font-mono text-xs font-bold tracking-widest text-text-muted uppercase">History</h3>
			<div class="flex flex-col gap-1.5">
				{#each history as h (h.id)}
					<div
						class={[
							'flex items-center gap-3 rounded-md border px-3 py-1.5 font-mono text-sm animate-number-pop',
							h.win ? 'border-accent/40 bg-accent/10' : 'border-border bg-surface-2'
						]}
					>
						<span class="flex gap-2 text-lg">{h.reels.join(' ')}</span>
						{#if h.win}
							<span class="ml-auto text-xs font-bold text-accent">WIN</span>
						{/if}
					</div>
				{/each}
			</div>
		</div>
	{/if}
</div>
