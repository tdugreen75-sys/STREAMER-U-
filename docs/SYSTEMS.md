# Streamer U Systems Architecture

## Identity System
- Every player receives and keeps the same Student ID.
- Authorized staff receive a Staff ID.
- Identity data is centralized so other systems can use it consistently.

## Dorm System
- Dorm locations are designated rather than randomly assigned at runtime.
- Rooms support two occupants.
- Each room has two separate beds on opposite sides.

## Uniform System
- A role-aware uniform closet provides authorized Streamer U clothing.
- Student and staff clothing can be managed independently.

## ID Card System
- Student ID cards identify students.
- Staff ID cards identify authorized staff.
- The system should provide a consistent UI/data source for identity display.

## Club System
Clubs should be configuration-driven so new clubs can be added without rewriting the core system.

Initial clubs:
- Fraternity
- Basketball
- Cheerleading
- Film
- Science & Engineering
- Musical Arts
- Debate
- Drama

## Class System
Classes provide creator-focused education content without implementing an in-game class schedule.

## SUPD System
- Role-based police functionality
- SUPD uniforms
- SUPD vehicles
- Campus safety interactions
- Access controls for authorized personnel

## Campus System
Reusable systems should support:
- Doors and access control
- Interactable facilities
- Campus signage
- Service areas
- Building-specific interactions

## Architecture Principles
- Server-authoritative gameplay logic
- Shared configuration for common data
- Focused modules with clear responsibilities
- Grouped remotes
- Clear client/server boundaries
- Independently testable systems
