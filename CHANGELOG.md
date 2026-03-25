# Changelog

## 3.18.0 (2026-03-25)

Full Changelog: [v3.7.1...v3.18.0](https://github.com/browserbase/stagehand-ruby/compare/v3.7.1...v3.18.0)

### Features

* [fix]: add `useSearch` & `toolTimeout` to stainless types ([e5bedb8](https://github.com/browserbase/stagehand-ruby/commit/e5bedb88ac67d34a6db440e470e3eb964205e558))
* [STG-1607] Yield finished SSE event instead of silently dropping it ([d5ffd2d](https://github.com/browserbase/stagehand-ruby/commit/d5ffd2d0ed6495673ef80ba0e1649bd1c1afa815))
* Add explicit SSE event names for local v3 streaming ([5be6d12](https://github.com/browserbase/stagehand-ruby/commit/5be6d1293763ecb7f0268884784475986de2915c))
* Add missing cdpHeaders field to v3 server openapi spec ([de6457f](https://github.com/browserbase/stagehand-ruby/commit/de6457f121764ffbadac51ec2a6103c27dbde338))
* Include LLM headers in ModelConfig ([23cb4ea](https://github.com/browserbase/stagehand-ruby/commit/23cb4ea1319287992f1174c2b8fa2eff5fdfc5c4))
* Revert broken finished SSE yield config ([1de4c00](https://github.com/browserbase/stagehand-ruby/commit/1de4c00c0b72936813fcd3e0499b51b1f135f33d))
* variables for observe ([a9d6970](https://github.com/browserbase/stagehand-ruby/commit/a9d6970e7f43f1d69eddb42a14f09fb7f9158b29))


### Chores

* **ci:** add build step ([ed6573f](https://github.com/browserbase/stagehand-ruby/commit/ed6573f2ddab4f5f51d1262480cb663da5e003d0))
* **ci:** skip lint on metadata-only changes ([079a802](https://github.com/browserbase/stagehand-ruby/commit/079a8028edf4e9dd09517363b0c1a3b16ed86865))
* **ci:** skip uploading artifacts on stainless-internal branches ([3a7e90b](https://github.com/browserbase/stagehand-ruby/commit/3a7e90bc8dd9f983dbbc7be16f997dd2dc02c3c0))
* **internal:** codegen related update ([f714af2](https://github.com/browserbase/stagehand-ruby/commit/f714af2d7d5b9b822362aa10f6f6facab3332eaf))
* **internal:** codegen related update ([ed9fab1](https://github.com/browserbase/stagehand-ruby/commit/ed9fab1f726c05ef48d4a55507b09212d7ced713))
* **internal:** tweak CI branches ([85b5b46](https://github.com/browserbase/stagehand-ruby/commit/85b5b4656c921f0784d05b27a3c4773b05b51cc6))
* **internal:** update gitignore ([b4bc8a8](https://github.com/browserbase/stagehand-ruby/commit/b4bc8a8ae60ff252080d4bfcd0fc6af26dc95e74))

## 3.7.1 (2026-02-27)

Full Changelog: [v3.7.0...v3.7.1](https://github.com/browserbase/stagehand-ruby/compare/v3.7.0...v3.7.1)

### Bug Fixes

* properly mock time in ruby ci tests ([ed2c2c2](https://github.com/browserbase/stagehand-ruby/commit/ed2c2c28400498332f0742b2616fd14a66646690))

## 3.7.0 (2026-02-25)

Full Changelog: [v3.6.1...v3.7.0](https://github.com/browserbase/stagehand-ruby/compare/v3.6.1...v3.7.0)

### Features

* Add bedrock to provider enum in Zod schemas and OpenAPI spec ([d48f5b4](https://github.com/browserbase/stagehand-ruby/commit/d48f5b49219186ee326adad925b4d1a67d4fd1c6))

## 3.6.1 (2026-02-25)

Full Changelog: [v3.6.0...v3.6.1](https://github.com/browserbase/stagehand-ruby/compare/v3.6.0...v3.6.1)

### Chores

* **internal:** remove mock server code ([621ce32](https://github.com/browserbase/stagehand-ruby/commit/621ce327c5c39cfebd023ca4a3b178f4eada2cdc))
* update mock server docs ([29f592b](https://github.com/browserbase/stagehand-ruby/commit/29f592b49d6b99450bd695a0f18f5addefcdade0))

## 3.6.0 (2026-02-18)

Full Changelog: [v3.5.2...v3.6.0](https://github.com/browserbase/stagehand-ruby/compare/v3.5.2...v3.6.0)

### Features

* randomize region used for evals, split out pnpm and turbo cache, veri… ([a68a9d2](https://github.com/browserbase/stagehand-ruby/commit/a68a9d2705b2c3b3b35dcaab4b5693184194774b))

## 3.5.2 (2026-02-07)

Full Changelog: [v3.5.1...v3.5.2](https://github.com/browserbase/stagehand-ruby/compare/v3.5.1...v3.5.2)

### Bug Fixes

* **client:** loosen json header parsing ([ea4142c](https://github.com/browserbase/stagehand-ruby/commit/ea4142cc5973c9207a81c7336c8425c9dbe63a30))


### Chores

* **docs:** remove www prefix ([8498bdd](https://github.com/browserbase/stagehand-ruby/commit/8498bdd34e0288b8a1c28e789d35dcecf91cd8b7))

## 3.5.1 (2026-02-03)

Full Changelog: [v3.5.0...v3.5.1](https://github.com/browserbase/stagehand-ruby/compare/v3.5.0...v3.5.1)

### Bug Fixes

* **client:** always add content-length to post body, even when empty ([7c7c43e](https://github.com/browserbase/stagehand-ruby/commit/7c7c43e51dd621d74dab8d1fa47de0dcc9bc0a28))

## 3.5.0 (2026-02-03)

Full Changelog: [v3.4.0...v3.5.0](https://github.com/browserbase/stagehand-ruby/compare/v3.4.0...v3.5.0)

### Features

* Removed MCP from readme for now ([ad8d58e](https://github.com/browserbase/stagehand-ruby/commit/ad8d58ef0e542592e9001b32ef3e921f480218da))

## 3.4.0 (2026-01-29)

Full Changelog: [v3.3.0...v3.4.0](https://github.com/browserbase/stagehand-ruby/compare/v3.3.0...v3.4.0)

### Features

* Add executionModel serialization to api client ([2042742](https://github.com/browserbase/stagehand-ruby/commit/20427425012c9ee785d18a74596808471be2dc7b))

## 3.3.0 (2026-01-29)

Full Changelog: [v3.2.1...v3.3.0](https://github.com/browserbase/stagehand-ruby/compare/v3.2.1...v3.3.0)

### Features

* Update stainless.yml for project and publish settings ([c55365a](https://github.com/browserbase/stagehand-ruby/commit/c55365a3bbc0ba0bdea32a10e13c58e5863e3ce4))


### Bug Fixes

* **docs:** fix mcp installation instructions for remote servers ([cd5418d](https://github.com/browserbase/stagehand-ruby/commit/cd5418d7b003862fcee89f5723a1e6449bdee8fa))

## 3.2.1 (2026-01-27)

Full Changelog: [v3.2.0...v3.2.1](https://github.com/browserbase/stagehand-ruby/compare/v3.2.0...v3.2.1)

## 3.2.0 (2026-01-27)

Full Changelog: [v3.1.0...v3.2.0](https://github.com/browserbase/stagehand-ruby/compare/v3.1.0...v3.2.0)

### Features

* add auto-bedrock support based on bedrock/provider.model-name ([fb3762b](https://github.com/browserbase/stagehand-ruby/commit/fb3762b610c4f3049bc74790424556c770bffcf4))

## 3.1.0 (2026-01-27)

Full Changelog: [v3.0.3...v3.1.0](https://github.com/browserbase/stagehand-ruby/compare/v3.0.3...v3.1.0)

### Features

* **api:** manual updates ([eb975f5](https://github.com/browserbase/stagehand-ruby/commit/eb975f5fa5718d2b8e715e8315ea66f898a0dfdc))

## 3.0.3 (2026-01-27)

Full Changelog: [v3.0.2...v3.0.3](https://github.com/browserbase/stagehand-ruby/compare/v3.0.2...v3.0.3)

## 3.0.2 (2026-01-22)

Full Changelog: [v3.0.1...v3.0.2](https://github.com/browserbase/stagehand-ruby/compare/v3.0.1...v3.0.2)

### Chores

* remove custom code ([3943364](https://github.com/browserbase/stagehand-ruby/commit/394336419ed210704639af03445858f44f03ba13))

## 3.0.1 (2026-01-15)

Full Changelog: [v0.6.2...v3.0.1](https://github.com/browserbase/stagehand-ruby/compare/v0.6.2...v3.0.1)

## 0.6.2 (2026-01-13)

Full Changelog: [v0.6.1...v0.6.2](https://github.com/browserbase/stagehand-ruby/compare/v0.6.1...v0.6.2)

## 0.6.1 (2026-01-06)

Full Changelog: [v0.6.0...v0.6.1](https://github.com/browserbase/stagehand-ruby/compare/v0.6.0...v0.6.1)

### Documentation

* add full example and update examples in README ([#8](https://github.com/browserbase/stagehand-ruby/issues/8)) ([3d8b897](https://github.com/browserbase/stagehand-ruby/commit/3d8b8978c4623f906fd809fdd44c91539098fe00))
* prominently feature MCP server setup in root SDK readmes ([f9a368b](https://github.com/browserbase/stagehand-ruby/commit/f9a368b0508862cd3ee53198ac92fe1265c5050f))

## 0.6.0 (2026-01-05)

Full Changelog: [v0.5.0...v0.6.0](https://github.com/browserbase/stagehand-ruby/compare/v0.5.0...v0.6.0)

### Features

* **api:** manual updates ([ffa5258](https://github.com/browserbase/stagehand-ruby/commit/ffa5258d23db78c2aa398289bc4d775fd5d145f0))

## 0.5.0 (2025-12-23)

Full Changelog: [v0.4.0...v0.5.0](https://github.com/browserbase/stagehand-ruby/compare/v0.4.0...v0.5.0)

### Features

* [STG-1053] [server] Use fastify-zod-openapi + zod v4 for openapi generation ([926a819](https://github.com/browserbase/stagehand-ruby/commit/926a819a4bbe2b260d3dbd46b860c444f60857bf))
* **api:** manual updates ([0619302](https://github.com/browserbase/stagehand-ruby/commit/061930217b3efce30e29cf8b2511970b21c86c57))


### Documentation

* add more examples ([3e81eba](https://github.com/browserbase/stagehand-ruby/commit/3e81eba0b962a3ec0c9a8b13fc9ae30f0961663e))

## 0.4.0 (2025-12-19)

Full Changelog: [v0.3.0...v0.4.0](https://github.com/browserbase/stagehand-ruby/compare/v0.3.0...v0.4.0)

### Features

* **api:** manual updates ([c93a988](https://github.com/browserbase/stagehand-ruby/commit/c93a988374918f841643a84145b3008970b665a7))


### Bug Fixes

* issue where json.parse errors when receiving HTTP 204 with nobody ([fc3e31e](https://github.com/browserbase/stagehand-ruby/commit/fc3e31e00944a7fdf89e367e281bc0510847d15e))

## 0.3.0 (2025-12-17)

Full Changelog: [v0.2.0...v0.3.0](https://github.com/browserbase/stagehand-ruby/compare/v0.2.0...v0.3.0)

### Features

* **api:** manual updates ([7dcf75c](https://github.com/browserbase/stagehand-ruby/commit/7dcf75cc0c580743b8bb0bbdb41077a6a7aa6dfb))
* **api:** manual updates ([3162ca0](https://github.com/browserbase/stagehand-ruby/commit/3162ca00c75b37ccb869d7a082f25b263e15d93d))
* **api:** manual updates ([a972ef7](https://github.com/browserbase/stagehand-ruby/commit/a972ef7dc9040af201ee8e87db013fc077a7ab3f))
* **api:** manual updates ([be169eb](https://github.com/browserbase/stagehand-ruby/commit/be169ebb8a61b86f4d1caee63aeded39139f10aa))
* **api:** manual updates ([2a98da9](https://github.com/browserbase/stagehand-ruby/commit/2a98da9563a1ab4e33d6bf3398083d772b61e07f))
* **api:** manual updates ([05879da](https://github.com/browserbase/stagehand-ruby/commit/05879da16a92ae6199ca2c4e323a6602fbc5d841))
* **api:** manual updates ([69e4183](https://github.com/browserbase/stagehand-ruby/commit/69e418398b943df8b7454b50ab02d17ba3feb212))
* **api:** manual updates ([9176bca](https://github.com/browserbase/stagehand-ruby/commit/9176bcaf88f115335199a44a52c8e1d697920822))
* **api:** manual updates ([36f0681](https://github.com/browserbase/stagehand-ruby/commit/36f0681452a11e25da7126e0270855bbdd3fe8df))


### Bug Fixes

* calling `break` out of streams should be instantaneous ([369b9d0](https://github.com/browserbase/stagehand-ruby/commit/369b9d0d37390d96fa673d08e64594cefc6a04fa))

## 0.2.0 (2025-12-16)

Full Changelog: [v0.1.0...v0.2.0](https://github.com/browserbase/stagehand-ruby/compare/v0.1.0...v0.2.0)

### Features

* **api:** manual updates ([d660a3a](https://github.com/browserbase/stagehand-ruby/commit/d660a3ad9cd54238d2bc6598b576e7677ebf120f))
* **api:** manual updates ([c21cb20](https://github.com/browserbase/stagehand-ruby/commit/c21cb20650bbad1ba8f6a89ad33dcf5ddfc53c81))
* **api:** manual updates ([f04453c](https://github.com/browserbase/stagehand-ruby/commit/f04453c6c2050b7815e3f62d14343dee4698879d))

## 0.1.0 (2025-12-16)

Full Changelog: [v0.0.1...v0.1.0](https://github.com/browserbase/stagehand-ruby/compare/v0.0.1...v0.1.0)

### Features

* **api:** manual updates ([5deaf8f](https://github.com/browserbase/stagehand-ruby/commit/5deaf8ff2011a2808dcfe66ef14470029bb3590e))
* **api:** manual updates ([87ce5f3](https://github.com/browserbase/stagehand-ruby/commit/87ce5f320056fb34770be2f0c87985960e995e92))
* **api:** manual updates ([2a8b9e7](https://github.com/browserbase/stagehand-ruby/commit/2a8b9e7d219360a5e783c650fc7c9544a9a6fbb5))
* **api:** manual updates ([0bcedba](https://github.com/browserbase/stagehand-ruby/commit/0bcedbaf26918822abdc958e6020f68b263ffee0))
* **api:** manual updates ([8355d5e](https://github.com/browserbase/stagehand-ruby/commit/8355d5e6b83f6c31f6494f771fba51b6e31023e7))
* **api:** manual updates ([655f517](https://github.com/browserbase/stagehand-ruby/commit/655f51718008b4c512eed1ce65660dae80039e49))
* **api:** tweak branding and fix some config fields ([c48f36e](https://github.com/browserbase/stagehand-ruby/commit/c48f36e307aafd9a2d6ac59d9857be789f29eaa1))


### Chores

* configure new SDK language ([3be44a3](https://github.com/browserbase/stagehand-ruby/commit/3be44a344d5bc49e7c2e16129c2b24db175f4eb6))
