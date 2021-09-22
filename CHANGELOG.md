1.0.0
=====

* (BREAKING) chore: pins `pre-commit-hooks` to `v4.0.1`.
* feat: add `pre-commit-afcmf` (`v0.1.2`).
* chore: pins `pre-commit-terraform` to `v1.50.0`.
* chore: bumps `terraform` + providers versions in example:
  * pins `terraform` to `>= 0.14`.
  * pins `aws` provider to `>= 3.0`.
  * pins `random` provider to `>= 3.0`.
* refactor: versions.tf, update versions.
* refactor: lint code.
* refactor: get rid of disabled example.
* refactor: default example:
  * add versions.tf file.
  * add providers.tf file.
  * add variables in variables.tf file.
  * refactor/lint deploy.tf file.
  * update README.md file.
* fix: LICENSE file.

0.2.0
=====

* feat: Add possibility to pass on static env vars

0.1.0
=====

* feat: Initial release
