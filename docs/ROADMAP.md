# Roadmap to graduation

Assumption I am working from: 2025 to 2029 batch, so roughly 33 months of
runway from September 2026. If the batch year is different, shift every block
but keep the order.

The target in the screenshot is around 1,500 contributions in a year. That is
about 4 a day, or more realistically 15 to 25 on the days you actually sit and
build. It is reachable by writing real code four or five days a week. It is not
reachable by committing once a day out of guilt.

## Phase 1: Foundation (Sep 2026 to Dec 2026)

Goal: stop being invisible. Anyone who opens the profile sees a name, a stack,
and three repos that run.

- Profile README live at `divitkej/divitkej` (draft in `docs/PROFILE_README.md`)
- Every existing repo gets a real README, a LICENSE, and a `.gitignore`
- `Whatsapp-Adding-Automation` goes public, or gets documented as private with
  a public writeup, since a private repo still counts on the graph but proves
  nothing to a reader
- One DSA or coursework repo, committed the day you solve the problem, not in
  a batch dump at the end of the month
- Learn the workflow in `docs/WORKFLOW.md` until branching and PRs are muscle
  memory

Checkpoint by 31 Dec 2026: 4 public repos, each with a README that explains
what it does, how to run it, and what you learned.

## Phase 2: Real projects (Jan 2027 to May 2027)

Goal: one project that a stranger can use without asking you questions.

- Build and deploy one full application, front to back, with a live URL
- Add tests to at least one repo, even if only a handful
- Turn on GitHub Actions on one repo so CI runs on every push
- First external contribution: find a small bug in a library you already use,
  open an issue, then open the pull request that fixes it
- Start using Issues on your own repos. Write the issue, then close it with a
  commit that references it. This is what the "Issues" and "Pull requests"
  slices on the activity chart are made of

Checkpoint by 31 May 2027: 1 deployed app, 1 repo with CI, 1 merged pull
request on a project that is not yours.

## Phase 3: Depth and the internship window (Jun 2027 to Dec 2027)

Goal: something on the profile that is hard to fake.

- PS-1 or a summer internship. Whatever you build there, build a public
  sibling project you own, since company code will not be yours to push
- Pick one area and go deep for six months. Compilers, systems, ML infra,
  embedded, graphics. Breadth is what everyone has, depth is what gets you
  interviews
- Publish one package or library, on npm, PyPI, or crates.io, with versioned
  releases and a changelog
- Write three technical posts about what you built. Link them from the repos

Checkpoint by 31 Dec 2027: 1 published package, 1 deep project with more than
50 commits of your own, first followers who are not friends.

## Phase 4: Signal (Jan 2028 to Dec 2028)

Goal: the profile starts doing the talking before you do.

- Sustained contribution to one open source project. Not drive-by typo fixes,
  pick a project, stay six months, get review privileges if it goes well
- Rewrite or retire the weakest three repos. A profile is judged by its worst
  pinned repo, not its best
- Mentor juniors on campus and co-author with them, so collaboration shows up
  in the graph as reviews and PRs, not just solo commits
- Final year project scoped and started early, in public where allowed

Checkpoint by 31 Dec 2028: 6 pinned repos you would defend in an interview,
a year of consistent activity behind you.

## Phase 5: Landing (Jan 2029 to graduation)

- PS-2 or final internship
- Freeze the profile into its best shape: pinned repos ordered by strength,
  profile README updated, stale forks deleted
- Every pinned repo has a one line description, topics set, and a link to a
  demo or a writeup

## What actually moves the graph

In rough order of value per hour spent:

1. Commits to your own projects, pushed the same day you write them
2. Pull requests, opened and reviewed
3. Issues opened and closed on your own repos
4. Code review comments on other people's PRs
5. Contributions to repos you do not own

The chart in the screenshot reads 97 percent commits and 3 percent pull
requests. That is a solo builder. You can beat that profile by having the same
commit volume plus visible collaboration.
