# Sticky sign-up page — setup

Three files, three destinations. Do them in this order.

| File | Goes into |
|---|---|
| `setup.sql` | Supabase's SQL Editor |
| `index.html` | your own file, then a host like Vercel or Netlify |
| — | your Instagram bio, once it's live |

---

## Step 1 — Supabase: create the table

Open your Supabase project → **SQL Editor** → paste the entire contents of
`setup.sql` → **Run**.

That's the whole step. Nothing to edit in that file — it's copy, paste, run.

What it does: creates a `signups` table with an `email` column, turns on Row
Level Security, and adds one rule allowing anyone to *insert* a row but
nobody to *read* the table back through the public key. You'll always view
the list yourself, signed in to the dashboard.

---

## Step 2 — Supabase: get your two values

Still in the dashboard: **Settings → API**.

Copy these two — you'll need them in Step 3:

- **Project URL** — looks like `https://abcdefgh.supabase.co`
- **anon public key** (some dashboards now label this **publishable key** —
  same thing, either name is fine) — a long string starting with `eyJ...`

Do **not** copy the `service_role` key. That one can bypass every rule you
just set up in Step 1, and must never go in a public webpage.

---

## Step 3 — index.html: paste your two values in

Open `index.html` in any text editor. Near the bottom, inside the
`<script>` tag, find this:

```js
const SUPABASE_URL = 'https://YOUR-PROJECT-REF.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ANON_PUBLIC_KEY';
```

Replace the two placeholder strings with your two values from Step 2.
Nothing else in the file needs to change. Save it.

---

## Step 4 — Put the file online

Upload `index.html` to a host — Vercel and Netlify both let you drag a
single file into their dashboard and give you a live URL back. Any host
works; those two need no configuration.

---

## Step 5 — Instagram

Put the live URL from Step 4 into your bio link.

---

## After it's live

- **See who's signed up:** Supabase dashboard → **Table Editor → signups**.
  Right-click to export as CSV whenever you want the list.
- **A duplicate email** shows "You're already on the list" on the page —
  that's expected, not an error.
- **If signups stop arriving** and the page still loads fine, check whether
  Supabase has paused your project for inactivity (free-tier projects can
  pause after quiet stretches) before assuming the code broke.
