import { useState } from 'react';
import { Mail, Loader2, HeartHandshake, CheckCircle2, MessageSquareHeart } from 'lucide-react';

const endpointUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/suggest-culture`;
const requestHeaders = {
  Authorization: `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
  'Content-Type': 'application/json',
};

export function CultureRequest() {
  const [cultureName, setCultureName] = useState('');
  const [message, setMessage] = useState('');
  const [email, setEmail] = useState('');
  const [status, setStatus] = useState<'idle' | 'sending' | 'sent' | 'error' | 'limited'>('idle');

  const submit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!cultureName.trim()) return;
    setStatus('sending');
    try {
      const response = await fetch(endpointUrl, {
        method: 'POST',
        headers: requestHeaders,
        body: JSON.stringify({
          cultureName: cultureName.trim(),
          message: message.trim() || null,
          email: email.trim() || null,
        }),
      });
      if (!response.ok) {
        if (response.status === 429) {
          setStatus('limited');
          return;
        }
        setStatus('error');
        return;
      }
      setStatus('sent');
    } catch {
      setStatus('error');
    }
  };

  if (status === 'limited') {
    return (
      <div className="rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-6 text-center shadow-sm sm:p-8">
        <MessageSquareHeart className="mx-auto h-8 w-8 text-[#8a6a3f]" />
        <h2 className="mt-3 font-serif text-xl font-semibold text-[#3c2d1e]">
          That's a lot of suggestions at once
        </h2>
        <p className="mx-auto mt-2 max-w-md text-sm leading-relaxed text-[#7a6a58]">
          To keep things fair, we can only take a few suggestions per
          visitor each hour. Please try again a little later — we truly
          want to hear about <span className="font-medium text-[#6b4e2e]">{cultureName.trim()}</span>.
        </p>
      </div>
    );
  }

  if (status === 'sent') {
    return (
      <div className="rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-6 text-center shadow-sm sm:p-8">
        <CheckCircle2 className="mx-auto h-8 w-8 text-[#8a6a3f]" />
        <h2 className="mt-3 font-serif text-xl font-semibold text-[#3c2d1e]">
          Thank you, your wish is with us
        </h2>
        <p className="mx-auto mt-2 max-w-md text-sm leading-relaxed text-[#7a6a58]">
        We read every suggestion carefully.
        <br />
        Stay connected for updates, new features, and exciting things to come!
        </p>
      </div>
    );
  }

  return (
    <div className="rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-6 shadow-sm sm:p-8">
      <div className="flex items-center gap-3">
        <span className="flex h-10 w-10 items-center justify-center rounded-xl bg-[#efe5d3]">
          <MessageSquareHeart className="h-5 w-5 text-[#6b4e2e]" />
        </span>
        <div>
          <h2 className="font-serif text-xl font-semibold text-[#3c2d1e]">
            Missing a culture you love?
          </h2>
          <p className="text-sm text-[#8a7a6b]">
            Tell us which one, we love to hear from you.
          </p>
        </div>
      </div>

      <form onSubmit={submit} className="mt-5 space-y-4">
        <div>
          <label htmlFor="culture-name" className="mb-1.5 block text-sm font-medium text-[#5b4130]">
            Which culture or language? <span className="text-[#6b4e2e]">*</span>
          </label>
          <input
            id="culture-name"
            type="text"
            required
            maxLength={80}
            value={cultureName}
            onChange={(e) => setCultureName(e.target.value)}
            placeholder="e.g. Persian, Hindi, Spanish, Amharic…"
            className="w-full rounded-xl border-0 bg-[#f9f4ec] py-3 px-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] transition-shadow placeholder:text-[#b09a83] focus:outline-none focus:ring-2 focus:ring-[#8a6a3f]"
          />
        </div>

        <div>
          <label htmlFor="culture-message" className="mb-1.5 block text-sm font-medium text-[#5b4130]">
            Anything else you'd love to see?{' '}
            <span className="text-xs font-normal text-[#8a7a6b]">optional</span>
          </label>
          <textarea
            id="culture-message"
            rows={3}
            maxLength={500}
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            placeholder='e.g. names meaning "light" for a girl, or names that work in both English and Arabic…'
            className="w-full resize-none rounded-xl border-0 bg-[#f9f4ec] py-3 px-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] transition-shadow placeholder:text-[#b09a83] focus:outline-none focus:ring-2 focus:ring-[#8a6a3f]"
          />
        </div>

        <div>
          <label htmlFor="culture-email" className="mb-1.5 block text-sm font-medium text-[#5b4130]">
            Your email <span className="text-xs font-normal text-[#8a7a6b]">optional, only if you'd like a reply</span>
          </label>
          <div className="relative">
            <Mail className="pointer-events-none absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-[#b09a83]" />
            <input
              id="culture-email"
              type="email"
              maxLength={120}
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="you@example.com"
              className="w-full rounded-xl border-0 bg-[#f9f4ec] py-3 pl-11 pr-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] transition-shadow placeholder:text-[#b09a83] focus:outline-none focus:ring-2 focus:ring-[#8a6a3f]"
            />
          </div>
        </div>

        {status === 'error' && (
          <p className="rounded-xl bg-[#efe5d3] px-4 py-3 text-sm text-[#6b4e2e]">
            Something went wrong sending your suggestion, please try again.
          </p>
        )}

        <button
          type="submit"
          disabled={status === 'sending' || !cultureName.trim()}
          className="inline-flex w-full items-center justify-end gap-2 rounded-xl bg-[#6b4e2e] px-5 py-3 text-sm font-semibold text-[#fefbf7] shadow-sm transition-all hover:bg-[#5a4226] disabled:cursor-not-allowed disabled:opacity-50 sm:w-auto"
        >
          {status === 'sending' ? (
            <>
              <Loader2 className="h-4 w-4 animate-spin" />
              Sending…
            </>
          ) : (
            <>
              <HeartHandshake className="h-4 w-4" />
              Send your suggestion
            </>
          )}
        </button>
      </form>
    </div>
  );
}
