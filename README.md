# 🟣 The Daily Apple: Human Intelligence Operating System (HIOS)
> **Core Manifesto:** *The Art of Official Human Intelligence (AOOHI) started with a seed and grew into The Daily Apple. Take a bite out of life and get to the core of connection.*

---

## 1. System Overview & Core Philosophy
The Daily Apple is a heart-core, anonymous-first social ecosystem built to prioritize human discernment, self-reflection, peer-to-peer bartering, and critical thinking over manipulative engagement algorithms.

* **Branding Emblem:** The Purple Apple (Wisdom, Intuition, and Authentic Lineage).
* **Primary Tech Stack:** Flutter / Dart (Mobile & Web Shell), Supabase / PostgreSQL (Backend, Auth, Vector Storage), Stripe (Escrow), ElevenLabs (Voice Synthesis).
* **Security Model:** 3-Tier Anonymity Architecture separating civic votes, daily reflections, and financial commerce.

---

## 2. The 3-Tier Anonymity Protocol

1. **Tier 1: Total Blind Anonymity (Civic Polls & Governance)**
   - Cryptographic zero-knowledge tokens for civic votes and controversial prompts.
   - Prevents fear of retaliation, doxxing, or mob judgment.

2. **Tier 2: Apple Alias Anonymity (Daily Prompts & Discovery)**
   - Dynamic handles (e.g., *Crisp Honeycrisp*, *Spiced Fuji*) generated deterministically per thread[span_0](start_span)[span_0](end_span).
   - Double-blind handshake matching; mutual profile reveal occurs only after reciprocal messaging[span_1](start_span)[span_1](end_span).

3. **Tier 3: Verified Identity (Commerce & Task Escrow)**
   - Verified accounts used strictly for P2P item swaps, local task wishlists, and escrow transactions.

---

## 3. Database Architecture & Migrations

The database structure covers 23 core migrations stored under `/supabase/migrations/`:

- **001–002:** Anonymous Queue & Double-Blind Matching Engine (FIFO & Spatial PostGIS)[span_2](start_span)[span_2](end_span).
- **003–012:** Core Profiles, Realtime Subscriptions, RLS Security Policies, and Auth Triggers.
- **013:** AOOHI Lineage Ledger & Directed Acyclic Graph (DAG) Metadata.
- **014–015:** Global Daily Seed Prompts Engine & Mosaic Visual Tile Canvas.
- **016:** Steel-Man Cognitive Workouts & Civic Consensus Governance.
- **017:** Escrow Stakes, Fine Portion Penalty Engine, and Prediction Markets.
- **018:** Integrity Gamification, Brier Accuracy Scoring, and Humility Badges.
- **019:** Micro-Quiz Vault, Language Immersion Duos, and P2P Marketplace.
- **020:** Receipt OCR Perks Log, Barter Swap Grid, and Local/Remote Task Wishlists.
- **021–023:** Zero-Knowledge Blind Vote Ledger & Double-Blind Nested Comments Protocol.

---

## 4. Double-Blind Anonymous Queue Schema (SQL)

```sql
-- 1. Track daily opt-ins for anonymous matching
CREATE TABLE public.anonymous_match_queue (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    prompt_id UUID NOT NULL,
    response_id UUID NOT NULL,
    response_embedding vector(1536), -- Semantic similarity via pgvector
    status VARCHAR(20) DEFAULT 'queued' CHECK (status IN ('queued', 'matched', 'expired')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, prompt_id)
);

-- 2. Store anonymous match pairings
CREATE TABLE public.anonymous_matches (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    prompt_id UUID NOT NULL,
    user_a_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    user_b_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'revealed', 'unmatched')),
    created_at TIMESTAMPTZ DEFAULT NOW()
);
