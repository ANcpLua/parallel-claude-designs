import Aurora from './components/Backgrounds/Aurora'
import Silk from './components/Backgrounds/Silk'
import Particles from './components/Backgrounds/Particles'
import SplitText from './components/TextAnimations/SplitText'
import BlurText from './components/TextAnimations/BlurText'
import DecryptedText from './components/TextAnimations/DecryptedText'
import ShinyText from './components/TextAnimations/ShinyText'
import CountUp from './components/TextAnimations/CountUp'
import GlitchText from './components/TextAnimations/GlitchText'
import SpotlightCard from './components/Components/SpotlightCard'
import TiltedCard from './components/Components/TiltedCard'
import AnimatedList from './components/Components/AnimatedList'
import StarBorder from './components/Components/StarBorder'
import ClickSpark from './components/Animations/ClickSpark'

function App() {
  return (
    <ClickSpark sparkColor="#7b68ee" sparkSize={12} sparkRadius={100} sparkCount={10}>
      <div className="min-h-screen">
        {/* ─── NAV ─── */}
        <nav className="fixed top-0 left-0 right-0 z-50 backdrop-blur-md bg-[#050510]/70 border-b border-white/5">
          <div className="max-w-6xl mx-auto flex items-center justify-between px-6 py-4">
            <GlitchText speed={1} enableShadows enableOnHover className="text-xl font-bold text-white">
              TourPlanner
            </GlitchText>
            <div className="hidden md:flex gap-8 text-sm text-white/60">
              <a href="#features" className="hover:text-white transition-colors">Features</a>
              <a href="#tours" className="hover:text-white transition-colors">Tours</a>
              <a href="#stats" className="hover:text-white transition-colors">Stats</a>
              <a href="#activity" className="hover:text-white transition-colors">Activity</a>
            </div>
          </div>
        </nav>

        {/* ─── HERO ─── */}
        <section className="relative min-h-screen flex items-center justify-center overflow-hidden">
          <div className="absolute inset-0" aria-hidden="true">
            <Aurora
              colorStops={['#5227FF', '#00e5ff', '#ff6ec7']}
              amplitude={1.5}
              blend={0.6}
              speed={0.5}
            />
          </div>
          <div className="relative z-10 text-center px-6 max-w-4xl mx-auto">
            <div className="backdrop-blur-xl bg-white/[0.04] border border-white/10 rounded-3xl p-10 md:p-16">
              <SplitText
                text="Discover Your Next Adventure"
                className="text-4xl md:text-6xl lg:text-7xl font-light text-white tracking-tight"
                delay={40}
                duration={0.8}
                ease="power3.out"
                splitType="chars"
                tag="h1"
              />
              <div className="mt-6">
                <BlurText
                  text="Plan, explore, and share tours with intelligent route optimization"
                  className="text-lg md:text-xl text-white/70 font-light"
                  delay={30}
                  animateBy="words"
                />
              </div>
              <div className="mt-10">
                <StarBorder
                  as="a"
                  className="inline-flex items-center gap-2 px-8 py-4 text-lg font-medium text-white rounded-full bg-[#5227FF]/30 hover:bg-[#5227FF]/50 transition-colors cursor-pointer"
                  color="#7b68ee"
                  speed="6s"
                >
                  Start Planning
                </StarBorder>
              </div>
              <div className="mt-8 flex flex-wrap justify-center gap-4">
                {[
                  { label: 'Tours', value: '10k+' },
                  { label: 'Countries', value: '150' },
                  { label: 'Rating', value: '4.9' },
                ].map((stat) => (
                  <div key={stat.label} className="px-5 py-2 rounded-full bg-white/[0.06] border border-white/10 text-sm">
                    <span className="text-white font-medium">{stat.value}</span>
                    <span className="text-white/50 ml-2">{stat.label}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* ─── FEATURES ─── */}
        <section id="features" className="relative py-24 overflow-hidden">
          <div className="absolute inset-0 opacity-40" aria-hidden="true">
            <Silk speed={3} scale={1.2} color="#5227FF" noiseIntensity={1} rotation={0.2} />
          </div>
          <div className="relative z-10 max-w-6xl mx-auto px-6">
            <div className="text-center mb-16">
              <ShinyText
                text="Built For Explorers"
                className="text-sm font-semibold uppercase tracking-widest"
                speed={3}
                color="#888"
                shineColor="#fff"
              />
              <h2 className="mt-4 text-3xl md:text-5xl font-light text-white">
                Everything you need on the trail
              </h2>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {[
                { icon: '&#9672;', title: 'Smart Routes', desc: 'AI-optimized paths with elevation data and weather-aware rerouting' },
                { icon: '&#9788;', title: 'Offline Maps', desc: 'Download entire regions. Navigate without signal, sync when back online' },
                { icon: '&#9733;', title: 'Group Sync', desc: 'Real-time position sharing. See your group on the map, always' },
              ].map((feature) => (
                <SpotlightCard
                  key={feature.title}
                  className="p-8 rounded-2xl"
                  spotlightColor="rgba(82, 39, 255, 0.2)"
                >
                  <div
                    className="text-3xl mb-4 text-[#7b68ee]"
                    dangerouslySetInnerHTML={{ __html: feature.icon }}
                  />
                  <h3 className="text-xl font-semibold text-white mb-2">{feature.title}</h3>
                  <p className="text-white/60 text-sm leading-relaxed">{feature.desc}</p>
                </SpotlightCard>
              ))}
            </div>
          </div>
        </section>

        {/* ─── TOURS ─── */}
        <section id="tours" className="py-24 bg-[#08081a]">
          <div className="max-w-6xl mx-auto px-6">
            <div className="text-center mb-16">
              <h2 className="text-3xl md:text-5xl font-light text-white">Featured Tours</h2>
              <p className="mt-4 text-white/50">Hover to explore. Click to begin.</p>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-12 justify-items-center">
              {[
                { title: 'Alpine Peaks Trail', gradient: 'linear-gradient(135deg, #667eea, #764ba2)', caption: '12 days · Advanced' },
                { title: 'Coastal Sunset Route', gradient: 'linear-gradient(135deg, #f093fb, #f5576c)', caption: '5 days · Moderate' },
                { title: 'Rainforest Canopy', gradient: 'linear-gradient(135deg, #4facfe, #00f2fe)', caption: '8 days · Beginner' },
              ].map((tour) => (
                <TiltedCard
                  key={tour.title}
                  imageSrc={`data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' width='300' height='300'><defs><linearGradient id='g' x1='0%25' y1='0%25' x2='100%25' y2='100%25'><stop offset='0%25' stop-color='${encodeURIComponent(tour.gradient.match(/#[a-f0-9]+/gi)?.[0] ?? '#667eea')}'/><stop offset='100%25' stop-color='${encodeURIComponent(tour.gradient.match(/#[a-f0-9]+/gi)?.[1] ?? '#764ba2')}'/></linearGradient></defs><rect width='300' height='300' fill='url(%23g)'/><text x='150' y='160' text-anchor='middle' fill='white' font-size='18' font-family='system-ui' opacity='0.9'>${encodeURIComponent(tour.title)}</text></svg>`}
                  altText={tour.title}
                  captionText={tour.caption}
                  containerHeight="320px"
                  containerWidth="280px"
                  imageHeight="300px"
                  imageWidth="280px"
                  rotateAmplitude={12}
                  scaleOnHover={1.08}
                  showMobileWarning={false}
                  showTooltip
                />
              ))}
            </div>
          </div>
        </section>

        {/* ─── STATS ─── */}
        <section id="stats" className="py-24">
          <div className="max-w-4xl mx-auto px-6">
            <div className="text-center mb-16">
              <h2 className="text-3xl md:text-5xl font-light text-white">By The Numbers</h2>
            </div>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
              {[
                { label: 'Tours Created', value: 12847, prefix: '' },
                { label: 'Active Users', value: 3291, prefix: '' },
                { label: 'Km Explored', value: 847203, prefix: '' },
                { label: 'Avg Rating', value: 487, prefix: '' },
              ].map((stat) => (
                <div key={stat.label} className="text-center">
                  <div className="text-3xl md:text-5xl font-light text-white mb-2 tabular-nums">
                    {stat.label === 'Avg Rating' ? (
                      <span className="flex items-baseline justify-center gap-0">
                        <CountUp to={4} from={0} duration={2} className="inline" />
                        <span>.</span>
                        <CountUp to={87} from={0} duration={2.5} className="inline" />
                      </span>
                    ) : (
                      <CountUp
                        to={stat.value}
                        from={0}
                        duration={2.5}
                        separator=","
                      />
                    )}
                  </div>
                  <div className="text-sm text-white/40 uppercase tracking-wider">
                    <DecryptedText
                      text={stat.label}
                      speed={60}
                      revealDirection="start"
                      animateOn="view"
                      className="text-white/40"
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* ─── ACTIVITY ─── */}
        <section id="activity" className="py-24 bg-[#08081a]">
          <div className="max-w-2xl mx-auto px-6">
            <div className="text-center mb-12">
              <h2 className="text-3xl md:text-4xl font-light text-white">Recent Activity</h2>
            </div>
            <div className="rounded-2xl border border-white/10 bg-white/[0.02] p-2 h-[400px]">
              <AnimatedList
                items={[
                  'Marco completed Alpine Peaks Trail in 11 days',
                  'Sarah started Coastal Sunset Route with 4 friends',
                  'Team Bravo finished Desert Oasis Trek — 4.9 rating',
                  'Elena bookmarked Rainforest Canopy Path',
                  'Jonas set a new speed record on Nordic Fjord Loop',
                  'Aya shared Arctic Aurora Route with her group',
                  'Leo completed his 50th tour — Legend status unlocked',
                  'Maya planned a 3-week Silk Road expedition',
                ]}
                showGradients
                enableArrowNavigation
                className="text-white/80"
              />
            </div>
          </div>
        </section>

        {/* ─── CTA ─── */}
        <section className="relative py-32 overflow-hidden">
          <div className="absolute inset-0" aria-hidden="true">
            <Particles
              particleCount={200}
              particleSpread={8}
              speed={0.3}
              particleColors={['#5227FF', '#00e5ff', '#ff6ec7']}
              moveParticlesOnHover
              particleHoverFactor={0.4}
              alphaParticles
              particleBaseSize={1.5}
              sizeRandomness={0.8}
              cameraDistance={3}
            />
          </div>
          <div className="relative z-10 text-center px-6">
            <h2 className="text-4xl md:text-6xl font-light text-white mb-6">
              Your Adventure Starts Now
            </h2>
            <p className="text-white/50 text-lg mb-10 max-w-lg mx-auto">
              Join 50,000+ explorers who plan smarter, travel farther, and discover more
            </p>
            <StarBorder
              as="a"
              className="inline-flex items-center gap-2 px-10 py-5 text-xl font-medium text-white rounded-full bg-[#5227FF]/30 hover:bg-[#5227FF]/50 transition-colors cursor-pointer"
              color="#00e5ff"
              speed="4s"
            >
              Start Your Free Trial
            </StarBorder>
            <p className="mt-6 text-white/30 text-sm">
              No credit card required · 14-day free trial · Cancel anytime
            </p>
          </div>
        </section>

        {/* ─── FOOTER ─── */}
        <footer className="border-t border-white/5 py-8">
          <div className="max-w-6xl mx-auto px-6 flex flex-col md:flex-row items-center justify-between gap-4">
            <span className="text-white/30 text-sm">
              Built with{' '}
              <a href="https://reactbits.dev" className="text-white/50 hover:text-white transition-colors" target="_blank" rel="noreferrer">
                ReactBits
              </a>
              {' '}· For science
            </span>
            <span className="text-white/20 text-xs">
              Aurora · Silk · Particles · SplitText · BlurText · DecryptedText · ShinyText · CountUp · GlitchText · SpotlightCard · TiltedCard · AnimatedList · StarBorder · ClickSpark
            </span>
          </div>
        </footer>
      </div>
    </ClickSpark>
  )
}

export default App
