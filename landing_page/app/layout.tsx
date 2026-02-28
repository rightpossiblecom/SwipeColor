import type { Metadata } from "next";
import { Geist, Geist_Mono, Outfit } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

const outfit = Outfit({
  variable: "--font-outfit",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "SwipeColor – Minimalist One-Line Puzzle Game",
  description: "Connect the dots in one continuous line. Experience the most satisfying minimalist puzzle game on mobile. Over 30 levels of brain-teasing fun.",
  keywords: ["SwipeColor", "puzzle game", "minimalist game", "one line puzzle", "brain teaser", "mobile game"],
  authors: [{ name: "SwipeColor Team" }],
  openGraph: {
    title: "SwipeColor – Minimalist One-Line Puzzle Game",
    description: "The most satisfying one-line puzzle game. Connect them all without lifting a finger.",
    type: "website",
    images: ["/og-image.png"],
  },
  twitter: {
    card: "summary_large_image",
    title: "SwipeColor – One-Line Puzzle",
    description: "Smart. Clean. Satisfying.",
    images: ["/og-image.png"],
  }
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="scroll-smooth">
      <body
        className={`${geistSans.variable} ${geistMono.variable} ${outfit.variable} antialiased selection:bg-indigo-500/20`}
      >
        {children}
      </body>
    </html>
  );
}
