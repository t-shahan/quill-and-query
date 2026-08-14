# Quill & Query Public-Release Design

**Status:** Approved for implementation
**Date:** 2026-08-13

## Summary

Prepare the private `t-shahan/rag-article-app` repository for a later public
portfolio release under the name **Quill & Query** and proposed GitHub slug
`quill-and-query`. Preserve the existing commit history. The repository owner,
not Codex, will perform the final GitHub rename and visibility change.

Quill & Query will be presented as a decommissioned, source-grounded editorial
research application. Its public documentation will emphasize the complete
engineering lifecycle: S3 article ingestion, OpenAI embeddings and answer
generation, MongoDB Atlas vector retrieval, the Streamlit-to-React/FastAPI
migration, persistent research sessions, API hardening, containerization, and
the former AWS deployment.

## Goals

- Give the project a distinctive editorial/research identity.
- Make the default branch safe and understandable for public viewing.
- Explain clearly that the hosted service and supporting infrastructure have
  been decommissioned and that no live demo is available.
- Provide enough setup and architecture information for a technical reviewer
  to understand or run the project with their own services and credentials.
- Retain the repository's history as evidence of iterative development.
- License the released source under the MIT License.

## Non-Goals

- Do not rename the GitHub repository or change its visibility.
- Do not push, publish, deploy, or recreate cloud infrastructure.
- Do not rewrite or squash Git history.
- Do not add application features, redesign the UI, or refactor the RAG
  architecture beyond changes required for branding and publication safety.
- Do not claim that the project has automated tests or CI; neither is present.

## Identity and Positioning

- Product name: **Quill & Query**
- Repository slug: `quill-and-query`
- Descriptor: **Source-grounded editorial research workspace**
- Portfolio status language:
  > **Project status: Decommissioned.** Quill & Query is preserved as a
  > portfolio project. Its hosted application and cloud infrastructure have
  > been retired; there is no live demo. The source remains available for
  > architectural review and local experimentation with user-provided services
  > and credentials.

Visible application branding will change from `RAG Article App` and
`Prototype` to `Quill & Query`. Internal names that remain technically accurate,
such as `rag_chain.py`, may stay unchanged to avoid cosmetic churn.

## README Structure

The new root `README.md` will be the main portfolio artifact and will contain:

1. Project name, editorial/research descriptor, and decommissioned-status
   notice above the fold.
2. A concise overview explaining the problem, intended workflow, and grounded
   answer behavior.
3. Key capabilities: article ingestion, semantic retrieval, streaming answers,
   citations, confidence indicators, follow-up questions, persistent
   conversations/projects, and searchable article metadata.
4. A Mermaid architecture diagram covering the React client, Nginx, FastAPI,
   OpenAI, MongoDB Atlas, and the S3 ingestion path.
5. A request/data-flow walkthrough for ingestion and question answering.
6. A section describing the migration from the original Streamlit prototype to
   the React/FastAPI architecture. The retained legacy files will be identified
   explicitly so they are not mistaken for the active application path.
7. Security and reliability notes covering JWT authentication, bcrypt password
   verification, request limits, Pydantic validation, shared MongoDB connection
   management, indexes, security headers, and grounded-answer constraints.
8. Local setup using `.env.example` and Docker Compose, including prerequisites
   for external OpenAI, MongoDB Atlas, and Amazon S3 services.
9. Deployment-history and decommissioning notes that describe AWS EC2,
   Lambda/EventBridge scheduling, Docker Compose, and Nginx without exposing a
   former host or implying that infrastructure remains active.
10. Known limitations, repository layout, stack, and MIT license.

The generated graphic at `frontend/src/assets/hero.png` may be used as a small
decorative project mark. It will not be presented as an application screenshot.

## Publication-Safety Changes

- Add `.env.example` containing names and safe placeholders for all required
  environment variables; never copy values from the local `.env` file.
- Keep `.env`, private keys, virtual environments, generated data, and frontend
  build output ignored.
- Replace the specific EC2 address and local key path in `scripts/deploy.sh`
  with required operator-supplied environment variables.
- Update the deployment path to the proposed `quill-and-query` slug while
  keeping it configurable.
- Remove the obsolete one-time EC2 termination schedule from
  `scripts/ec2-scheduler-setup.sh`; retain the generic start/stop example as
  historical infrastructure code with explicit warnings.
- Remove the generic Vite template README under `frontend/` so it does not
  compete with the root project documentation.
- Add the standard MIT License with Taylor Shahan as the copyright holder.

The existing reachable Git history contains no tracked `.env` or key files and
no matches for common high-confidence API-key, cloud-key, private-key, or
MongoDB-credential patterns. One historical commit retains the former EC2
address and local key filename. Because those strings are infrastructure
metadata rather than credentials and the deployment is decommissioned, history
will be preserved. The default branch will contain only the sanitized form.

## Application and Metadata Updates

- Replace visible React and legacy Streamlit titles with `Quill & Query`.
- Change the browser title and FastAPI application title.
- Replace the generic frontend package name with a Quill & Query-specific name
  and keep `package-lock.json` synchronized.
- Replace the browser token-storage key with a project-specific key; existing
  local sessions may be invalidated, which is acceptable for a decommissioned
  application.
- Update comments and deployment references only where an old product name or
  repository slug would confuse public readers.

## Verification

Before handoff:

- Run the frontend production build and ESLint.
- Compile-check all tracked Python source files without starting the service or
  calling external APIs.
- Validate Docker Compose configuration without launching containers.
- Search the default branch for the old product name, `Prototype`, the former
  EC2 address, and the old repository slug; any retained occurrence must be
  intentional and documented.
- Re-run the tracked-history filename and high-confidence secret-pattern checks.
- Review the rendered Markdown structure and all commands in the README.
- Confirm that the worktree contains no changes to `.env` and no generated
  credentials or build artifacts.

## Handoff

After implementation and verification, provide the owner with:

- a summary of all local changes and verification results;
- the exact GitHub repository name and suggested description;
- a short manual checklist to rename the private repository to
  `quill-and-query`, update the local remote if GitHub does not redirect it, and
  change visibility to public;
- an explicit reminder that Codex did not perform the rename, push, or
  visibility change.

## Acceptance Criteria

- The default branch reads consistently as Quill & Query.
- The root README clearly states that the project is decommissioned and has no
  live service.
- Public documentation accurately describes the implemented architecture and
  does not claim tests, CI, or active infrastructure.
- The current deployment scripts contain no former host address or local key
  path and cannot operate without explicit configuration.
- `.env.example` contains placeholders only, and MIT licensing is present.
- Local build, lint, Python compile, and Compose configuration checks pass, or
  any pre-existing failure is documented precisely.
- GitHub remains private and retains its current name until the owner performs
  the final release actions.
