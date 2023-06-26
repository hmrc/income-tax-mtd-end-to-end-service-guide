---
title: API Deprecation Guidance
weight: 55
---


# API lifecycle & deprecation

Each MTD API follows a lifecycle from the point where it is first published to the point where it is retired.

More specifically, every version of each API follows a lifecycle. Different versions of the same API can be at different points in the lifecycle. For example, v1.0 might be retired, v2.0 might be stable and v3.0 might be in private beta.

## API status

The following table gives details of the possible API statuses:

| Status     | Meaning                                                                                                                                                                                                                                                                                                                                                                                                            | Documentation visible? | Can be subscribed to in Developer Hub? | Endpoints enabled? |
|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------|----------------------------------------|--------------------|
| ALPHA      | As per GDS Alpha stage - early prototype - documentation only with the endpoints set to False, available in External Test.  Intended for feedback on the initial API design and documentation. Expect breaking changes and behaviour changes.                                                                                                                                                                      | Yes                    | No                                     | No                 |
| BETA       | As per GDS Beta stage - live service but not stable. Breaking changes and behaviour changes are possible. When making a breaking change we advise giving a minimum of 6 weeks notice and to work with SDST to communicate the change.                                                                                                                                                                              | Yes                    | Yes                                    | Yes                |
| STABLE     | As per GDS Live stage - stable live service. No breaking changes and only minor behaviour changes. You will have completed the Stable Assessment.                                                                                                                                                                                                                                                                  | Yes                    | Yes                                    | Yes                |
| DEPRECATED | Make sure you have funds to support the API during this stage of the life cycle. Planned to be retired, either because a new version of the API is available, or because the API is no longer supported.  A new version of the API should be available in external test when you deprecate the current version.  Read the deprecating APIs section for information about different scenarios for deprecating APIs. | Yes                    | No                                     | Yes                |
| RETIRED    | API is no longer in use.                                                                                                                                                                                                                                                                                                                                                                                           | No                     | No                                     | No                 |


## Deprecating APIs

If an API has been in production with a status of STABLE, we aim for a deprecation period of 6 months. 

For an API in BETA, we aim to give a minimum of 6 weeks notice before deprecation.

The status of APIs is indicated in the API documentation. In releases from June 2023 onwards, deprecation status will also be indicated in the response headers.

Applications cannot subscribe to a deprecated API version, but can still call the API version if the subscription was made before the status changed.

## Deprecating endpoints

We will not deprecate specific API endpoints. Removing an endpoint from an API will cause a breaking change. 

If we have to remove an endpoint, we will mark the API as DEPRECATED and release a new version of the API by making a major version change, for example, v1.0 to v2.0. 

## Retiring APIs

Once an API has been DEPRECATED for the amounts of time indicated above, it can be retired and the endpoints and documentation will be removed. Ensure that your application does not rely on any deprecated APIs.


