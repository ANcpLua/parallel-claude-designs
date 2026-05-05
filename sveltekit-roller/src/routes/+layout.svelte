<script lang="ts">
	import '../app.css';
	let { children } = $props();
</script>

<nav class="fixed top-0 z-50 w-full border-b border-border bg-bg/80 backdrop-blur-xl">
	<div class="mx-auto flex h-14 max-w-5xl items-center gap-6 px-6">
		<a href="/" class="font-mono text-sm font-bold tracking-wider text-accent">ROLLER</a>
		<a href="/dice" class="text-sm text-text-muted hover:text-text">Dice</a>
		<a href="/slots" class="text-sm text-text-muted hover:text-text">Slots</a>
		<a href="/rng" class="text-sm text-text-muted hover:text-text">RNG</a>
	</div>
</nav>
<main class="mx-auto max-w-5xl px-6 pt-20 pb-12">
	{@render children()}
</main>
