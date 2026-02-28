export default function Features() {
    const features = [
        {
            title: "One-Stroke Challenge",
            description: "Connect all dots in a single continuous line. Lift your finger and you fail. Simple rules, complex mastery.",
            icon: (
                <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" className="w-6 h-6 text-indigo-400">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M15.25 12h-3.5m-3.5 0H4.75m14.5 0H15.25m0 0V4.75m0 7.25v7.25" />
                </svg>
            )
        },
        {
            title: "Smart Progression",
            description: "Over 30 levels designed to challenge your spatial reasoning. From simple 3-dot layouts to complex geometric puzzles.",
            icon: (
                <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" className="w-6 h-6 text-emerald-400">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M13 10V3L4 14h7v7l9-11h-7z" />
                </svg>
            )
        },
        {
            title: "Satisfying Feedback",
            description: "Carefully tuned haptic feedback and soft audio cues make every connection feel impactful and rewarding.",
            icon: (
                <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" className="w-6 h-6 text-indigo-400">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                </svg>
            )
        },
        {
            title: "Minimalist Focus",
            description: "Zero clutter. No ads, no popups. Just you and the puzzle. Designed for a state of deep flow.",
            icon: (
                <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" className="w-6 h-6 text-emerald-400">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M5.636 18.364a9 9 0 010-12.728m12.728 0a9 9 0 010 12.728m-9.9-2.829a5 5 0 010-7.07m7.072 0a5 5 0 010 7.07M13 12a1 1 0 11-2 0 1 1 0 012 0z" />
                </svg>
            )
        }
    ];

    return (
        <section id="features" className="py-24 md:py-32 bg-black">
            <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div className="mb-20 text-center">
                    <h2 className="mb-4 text-3xl md:text-5xl font-bold tracking-tight text-white leading-tight">
                        Designed for <span className="text-indigo-400 italic">Playfulness</span>.
                    </h2>
                    <p className="mx-auto max-w-2xl text-lg text-zinc-400 leading-relaxed">
                        SwipeColor isn&apos;t just a game. It&apos;s a digital playground designed by puzzle lovers for puzzle lovers.
                    </p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                    {features.map((feature, i) => (
                        <div
                            key={i}
                            className="group p-8 rounded-2xl bg-zinc-900 border border-white/5 transition-all hover:border-indigo-500/20 hover:bg-zinc-800/50"
                        >
                            <div className="mb-6 inline-flex h-12 w-12 items-center justify-center rounded-xl bg-zinc-800 shadow-inner group-hover:scale-110 transition-transform">
                                {feature.icon}
                            </div>
                            <h3 className="mb-4 text-xl font-bold text-white group-hover:text-indigo-400 transition-colors">
                                {feature.title}
                            </h3>
                            <p className="text-zinc-400 leading-relaxed text-sm">
                                {feature.description}
                            </p>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
}
