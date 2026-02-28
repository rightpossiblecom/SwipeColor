export default function HowItWorks() {
    const steps = [
        {
            title: "1. Analyze",
            description: "Quickly scan the dots to find the hidden path. Each dot must be connected exactly once.",
            icon: (
                <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" className="w-5 h-5">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                </svg>
            )
        },
        {
            title: "2. Sweep",
            description: "Tap the starting dot and maintain contact with the screen. Glide through each target in order.",
            icon: (
                <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" className="w-5 h-5">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 11l5-5m0 0l5 5m-5-5v12" />
                </svg>
            )
        },
        {
            title: "3. Master",
            description: "Complete the connection to clear the level and earn stars based on your precision and speed.",
            icon: (
                <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" className="w-5 h-5">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
            )
        }
    ];

    return (
        <section id="how-it-works" className="py-24 md:py-32 relative overflow-hidden bg-gradient-to-b from-black to-zinc-950">
            <div className="absolute top-1/2 left-0 w-full h-px bg-gradient-to-r from-transparent via-white/10 to-transparent -z-10" />

            <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div className="MAX-W-3xl mx-auto mb-20 text-center">
                    <h2 className="mb-6 text-3xl md:text-5xl font-bold tracking-tight text-white">
                        Simple to Play, <br />
                        Hard to <span className="text-emerald-400 italic">Put Down</span>.
                    </h2>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                    {steps.map((step, i) => (
                        <div
                            key={i}
                            className="relative p-10 rounded-3xl bg-zinc-900 border border-white/5 transition-transform hover:-translate-y-2 group"
                        >
                            <div className="mb-8 inline-flex h-12 w-12 items-center justify-center rounded-2xl bg-indigo-500/10 text-indigo-400 group-hover:bg-indigo-500 group-hover:text-white transition-all">
                                {step.icon}
                            </div>
                            <h3 className="mb-4 text-2xl font-bold text-white leading-tight">
                                {step.title}
                            </h3>
                            <p className="text-zinc-400 leading-relaxed">
                                {step.description}
                            </p>

                            {i < steps.length - 1 && (
                                <div className="hidden lg:block absolute top-1/2 -right-4 translate-x-1/2 -translate-y-1/2">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" className="text-zinc-800">
                                        <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
                                    </svg>
                                </div>
                            )}
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
}
