# Change Log

All notable changes to the package should be documented in this file.

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

## [Unreleased]

## [0.3.1] - 2019-06-26
### Changed
- Switch to use `name` attribute to identify workflow steps.

## [0.3.0] - 2019-06-21
### Added
- Task `save-package-configuration` to store SendGrid API key in package configuration settings.
- Template `configure` lets users configure the package.

### Changed
- Task `send-email` uses API key from package configuration, if not explicitly specified. Parameter `apiKey` is now optional.

## [0.2.1] - 2019-06-13
### Changed
- Task `send-mail`: improve logging and error handling.

## [0.2.0] - 2019-06-12
### Added
- Initial version of the package.
- Task `send-email`.
