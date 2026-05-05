<div class="flex flex-col items-center pt-16">
	<h1 class="font-mono text-5xl font-bold tracking-tight">
		sveltekit<span class="text-accent">-roller</span>
	</h1>
	<p class="mt-3 text-text-muted">Hyper-modern RNG. Three modes. Zero framework tax.</p>

	<div class="mt-16 grid w-full max-w-3xl gap-4 sm:grid-cols-3">
		{#each [
			{ href: '/dice', icon: '🎲', label: 'Dice', desc: 'D4 through D20' },
			{ href: '/slots', icon: '🎰', label: 'Slots', desc: '3-reel spinner' },
			{ href: '/rng', icon: '🔢', label: 'RNG', desc: 'Range, coin, list' },
		] as r (r.href)}
			<a href={r.href} class="group flex flex-col items-center gap-3 rounded-xl border border-border bg-surface p-8 transition-all hover:-translate-y-1 hover:border-accent">
				<span class="text-4xl">{r.icon}</span>
				<span class="font-mono font-bold">{r.label}</span>
				<span class="text-sm text-text-muted">{r.desc}</span>
			</a>
		{/each}
	</div>
</div>
