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
| ALPHA      | Early prototype - documentation only, available in External Test.  Intended for feedback on the initial API design and documentation. Expect breaking changes and behaviour changes.                                                                                                                                                                      | Yes                    | No                                     | No                 |
| BETA       | Live service but not stable. Breaking changes and behaviour changes are possible.                                                                                                                                                                             | Yes                    | Yes                                    | Yes                |
| STABLE     | Stable live service. No breaking changes and only minor behaviour changes.                                                                                                                                                                                                                                                                  | Yes                    | Yes                                    | Yes                |
| DEPRECATED | Set to be retired, either because a new version of the API is available, or because the API is no longer supported. If applicable, a new version of the API will be available in external test when the current version is deprecated. | Yes                    | No                                     | Yes                |
| RETIRED    | API is no longer in use.                                                                                                                                                                                                                                                                                                                                                                                           | No                     | No                                     | No                 |                                                                                                                                                                                                                                                                                                                                                                                        | No                     | No                                     | No                 |


## Breaking changes

Any change that might break software that relies on an API is counted as breaking change.

The table below lists changes that we consider breaking. 

| Area | Breaking changes |
|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Query Param   | <ul><li>Adding mandatory query param</li><li>Removing a query param</li><li>Renaming a query param</li><li>Changing an optional query param to be mandatory</li><li>Removing/renaming a value from an enum   </li></ul>                                                         |
| Request Body  | <ul><li> Adding a mandatory field </li><li> Removing a field </li><li> Renaming a field </li><li> Changing an optional field to be mandatory </li><li> Removing/renaming a value from an enum  </li></ul>                                                                                |
| Response Body | <ul><li> Removing a field </li><li> Renaming a field </li><li> Changing a mandatory field to be optional </li><li> Adding/renaming a value to an enum  </li></ul>                                                                                                               |
|  Other        | <ul><li> Changing the URL of the endpoint </li><li> Removing a resource/endpoint </li><li> Changing the semantics of a field value (for example, the value returned changes from inclusive of VAT to exclusive of VAT) </li><li> Changing validation to have stronger constraints </li></ul> |


## Changes to errors

When we make changes to errors, we will not usually change the JSON structure returned (in the rare case when this is necessary, this will be considered a breaking change). The values of the error fields may change. 


### Breaking changes for errors

* Changing the HTTP Status code to a different value
* Renaming an error code
* Adding a new error code (but see below)

If we add a new error code to an endpoint as part of a new field/object which is not itself a breaking change, then the new error is not counted as breaking change.

For example, suppose we add a new optional string field to the request body and the field must satisfy a specific condition, otherwise it fails with a new error. This error is not considered a breaking change, since existing software will keep functioning as the error can only be returned if the new field is used.


### Non-breaking changes for errors

* Removing an error code
* Changing the message of an error



## Deprecating APIs

If an API has been in production with a status of STABLE, we aim for a deprecation period of 6 months. 

For an API in BETA, we aim for a deprecation period of 6 weeks minimum.


The status of APIs is indicated in the API documentation. In releases from June 2023 onwards, deprecation status will also be indicated in the response headers.

Applications cannot subscribe to a deprecated API version, but can still call the API version if the subscription was made before the status changed.


## Retiring APIs

Once an API has been DEPRECATED for the amounts of time indicated above, it can be retired and the endpoints and documentation will be removed. Ensure that your application does not rely on any deprecated APIs.


