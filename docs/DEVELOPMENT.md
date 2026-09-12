# Development Workflow

## Standard Workflow
1. Plan the feature and requirements.
2. Define architecture and documentation.
3. Implement in VS Code using Rojo.
4. Sync the project into Roblox Studio.
5. Test in Studio.
6. Report bugs and review results.
7. Fix, refactor, and integrate.
8. Commit the completed work to GitHub.

## Responsibilities
### ChatGPT
- Architecture
- System design
- Requirements and specifications
- Project organization
- Debugging strategy
- Integration planning
- Code review

### Claude
- Primary implementation in VS Code
- Refactoring
- Implementation fixes
- Completing code from the approved architecture

### Project Owner
- Final design decisions
- Roblox Studio testing
- Asset/model decisions
- Final approval

## Collaboration Rule
Do not have ChatGPT and Claude modify the same files at the same time. Keep GitHub as the source of truth and make changes in clear, reviewable commits.

## Rojo
`default.project.json` maps the project's `src` folders into Roblox Studio. Keep the repository structure organized so Rojo can sync it predictably.
