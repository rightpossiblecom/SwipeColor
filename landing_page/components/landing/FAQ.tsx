export default function FAQ() {
    const faqs = [
        {
            question: "What is SwipeColor?",
            answer: "SwipeColor is a minimalist mobile puzzle game where your goal is to connect all the dots on the screen in one continuous stroke without lifting your finger."
        },
        {
            question: "Is the game free to play?",
            answer: "Yes, SwipeColor is free to download and play. We focus on providing a premium experience without intrusive interruptions."
        },
        {
            question: "Can I play offline?",
            answer: "Absolutely. All level data is stored locally on your device, so you can enjoy SwipeColor anywhere, even without an internet connection."
        },
        {
            question: "How many levels are available?",
            answer: "The current version features over 30 hand-crafted levels of increasing difficulty. We are regularly adding new challenges in updates."
        },
        {
            question: "What happens if I lift my finger?",
            answer: "If you lift your finger before connecting all the required dots, the level resets. The challenge is in the precision and the flow."
        }
    ];

    return (
        <section id="faq" className="py-24 md:py-32 bg-black border-t border-white/5">
            <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8">
                <div className="mb-20 text-center">
                    <h2 className="mb-4 text-3xl md:text-5xl font-bold tracking-tight text-white leading-tight">
                        Commonly <span className="text-emerald-400 italic">Asked Questions</span>.
                    </h2>
                    <p className="mx-auto max-w-xl text-lg text-zinc-400 leading-relaxed">
                        Everything you need to know about the SwipeColor experience.
                    </p>
                </div>

                <div className="grid grid-cols-1 gap-6">
                    {faqs.map((faq, i) => (
                        <div
                            key={i}
                            className="group p-8 rounded-2xl bg-zinc-900 border border-white/5 transition-all hover:border-white/10"
                        >
                            <h3 className="mb-4 text-xl font-bold text-white group-hover:text-indigo-400 transition-colors cursor-pointer">
                                {faq.question}
                            </h3>
                            <p className="text-zinc-400 leading-relaxed max-w-2xl">
                                {faq.answer}
                            </p>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
}
