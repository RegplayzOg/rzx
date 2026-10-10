# RZX capes

Drop a cape PNG into this folder (GitHub: **Add file → Upload files**) and it shows up in RZX within a few minutes.

- **Format:** a standard Minecraft cape texture, `64x32` (or a 2:1 HD multiple such as `128x64`). Keep files under 2 MB.
- **Name:** the file name becomes the cape's id and display name, e.g. `rzx-teal.png` is "Rzx Teal". Use lowercase letters, digits and `-`.
- **Index:** `index.json` is rebuilt automatically by the *Cape index* workflow when a PNG is added or removed. Don't edit it by hand.
- **Who wears what:** `players.json` maps a player's UUID (32 hex characters, no dashes) to a cape id:

```json
{ "players": { "069a79f444e94726a5befca90e38aaf5": "rzx-teal" } }
```
