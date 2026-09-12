# Streamer U 2026 Campus

A large-scale Roblox university campus where creators create, grow, and become the next big creator.

## Development
- Roblox Studio
- VS Code
- Rojo
- GitHub

## Repository Structure
```text
src/
├── ServerScriptService/
│   ├── Systems/
│   │   ├── Identity/
│   │   ├── Dorms/
│   │   ├── Uniforms/
│   │   ├── Clubs/
│   │   ├── Classes/
│   │   ├── SUPD/
│   │   └── Campus/
│   └── Services/
├── ReplicatedStorage/
│   ├── Shared/
│   ├── Remotes/
│   └── Config/
├── StarterPlayer/
│   └── StarterPlayerScripts/
└── Workspace/
    └── Campus/

docs/
├── CAMPUS_PLAN.md
├── SYSTEMS.md
└── DEVELOPMENT.md

assets/
├── Campus/
├── Buildings/
├── Vehicles/
└── Uniforms/

default.project.json
```

## Core Systems
- Student and Staff Identity
- Dormitories
- Uniform Closet
- Student/Staff ID Cards
- Clubs
- Classes
- Creator Facilities
- Campus Systems
- Streamer U Police Department (SUPD)

## Team Workflow
ChatGPT handles architecture, requirements, systems design, organization, debugging, and integration planning. Claude handles primary implementation in VS Code. The project owner tests in Roblox Studio and makes final asset/design decisions. GitHub is the source of truth.

Do not have both AIs modify the same files at the same time.
