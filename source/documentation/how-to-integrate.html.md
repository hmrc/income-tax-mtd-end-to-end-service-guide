---
title: How to integrate with HMRC APIs | Income Tax (Making Tax Digital) end-to-end service guide
weight: 2
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# How to integrate with HMRC APIs

## Minimum functionality standards

Previously, the production approvals process included an assessment of whether a product includes certain minimum functionality.

In response to developer feedback, we are content for software developers to build MTD Income Tax products iteratively and be granted production credentials for specific elements of the minimum required functionality. However, an MTD Income Tax product will only be listed on the software choices viewer when it satisfies all of the following requirements:

- a software product must submit the fraud prevention header data required by law.
- a Making Tax Digital for Income Tax product must allow the customer to:
  - create and maintain all business records a customer is required by law to keep in digital form (but see [bridging software](/guides/income-tax-mtd-end-to-end-service-guide/#bridging-software))
  - submit quarterly update information for each business income source (self-employment, multiple self-employments, UK property income)
  - have the option to provide accounting and other adjustments and an estimate of allowances to be claimed for any business income source
  - submit an End of Period Statement for each business income source (with declaration of completeness)
  - call for and view an estimate of their Income Tax liability for each tax year at any time
  - make a self-assessment of the tax and Class 4 National Insurance contributions due on their total taxable income and a final declaration of completeness and correctness no later than 31 January following the end of tax year in which that income is taxable
  - carry forward or set sideways (when permitted) business losses occurring in any one year as well as to apply losses incurred in earlier years against current year profits
  - have visibility of all their Class 2 National Insurance contributions (so that they can make additional voluntary contributions if they wish)

The Making Tax Digital for Income Tax APIs that include the endpoints for the functionality described above are:

- [Business Details](/api-documentation/docs/api/service/business-details-api/)
- [Business Income Source Summary](/api-documentation/docs/api/service/self-assessment-biss-api/)
- [Business Source Adjustable Summary](/api-documentation/docs/api/service/self-assessment-bsas-api)
- [Individuals Business End of Period Statement](/api-documentation/docs/api/service/individuals-business-eops-api/)
- [Individual Calculations](/api-documentation/docs/api/service/individual-calculations-api)
- [Individuals Disclosures (Class 2 NICs)](/api-documentation/docs/api/service/individuals-disclosures-api)
- [Individual Losses](/api-documentation/docs/api/service/individual-losses-api)
- [Obligations](/api-documentation/docs/api/service/obligations-api/)
- [Property Business](/api-documentation/docs/api/service/property-business-api/) (only for property full product)
- [Self-Employment Business](/api-documentation/docs/api/service/self-employment-business-api/) (only for self-employment full product)

### Fraud Prevention Headers

You must supply fraud prevention header information for all our APIs before approval can be granted and production credentials issued.

HMRC must see evidence of fraud prevention headers being sent and be satisfied with their level of accuracy.

The developer must test their fraud prevention headers and provide SDST with screenshot evidence that the correct response is received from the [Test Fraud Prevention Headers API](/api-documentation/docs/api/service/txm-fph-validator-api/). [Guidance on Fraud Prevention Headers](/guides/fraud-prevention/) is available.

## Getting Production Approval

Our key objectives for MTD for Income Tax are to:

- ensure customers have a streamlined end-to-end journey and software that supports everything a business customer needs to do to meet their Income Tax obligations
- safeguard customer data and protect HMRC systems against fraud and criminal attack

This section of the guide explains the features your product must include before production credentials are sought, together with features you should consider building into your products.

### Overview of developer journey to production credentials (step by step)

1. Sign in to the [developer hub](/api-documentation) and register your application for sandbox testing.
2. [Create a test user which is an individual](/api-documentation/docs/api/service/api-platform-test-user/1.0/oas/page#tag/create-test-user/operation/Createatestuserwhichisanindividual) to create test data.
3. Review the [API documentation](/api-documentation/docs/api?filter=income-tax-mtd) and Income Tax end-to-end service guide.
4. Test ITSA endpoints and develop your software application. Any queries during this phase should be sent to [SDSTeam@hmrc.gov.uk](mailto:SDSTeam@hmrc.gov.uk).
5. Register your application for production credentials by creating a production application within your developer hub account and completing the requested sections.
6. Provide testing logs and credentials used for testing to HMRC.
7. Developer testing is reviewed by HMRC (including fraud header validity):
    - if satisfactory, you will be invited to demonstrate your product
    - if unsatisfactory, further testing and development will be required for review
8. The software provider uses screen sharing to demonstrate its software to HMRC.
9. Production credentials are issued if all requirements are met. If not, further development is required and a new demonstration will be arranged.

### Product build

Developers have the option to either build all elements required to meet [minimum functionality standards (MFS)](/guides/income-tax-mtd-end-to-end-service-guide/#minimum-functionality-standards) in one go or to build these elements iteratively. If you choose to build iteratively, you will be required to demonstrate your product after each stage of the build. There are three stages, although many developers choose to develop stages 2 and 3 together. 

The three stages are:

1. In-year functionality (submitting periodic updates).
2. End of Period (EOPs).
3. Final declaration.

The [Income Tax (Making Tax Digital) roadmap](/roadmaps/mtd-itsa-vendors-roadmap/documentation/mfs.html) shows which APIs are required at each stage of the build.

### Testing requirements

HMRC requires the software to test all the APIs that they require access to. The following points relate to access to both new API subscriptions and version updates of existing API subscriptions:

- For APIs included in the [minimum functionality standards](/guides/income-tax-mtd-end-to-end-service-guide/#minimum-functionality-standards), you are required to test all endpoints shown within the documentation.
- For APIs not included in the minimum functionality standards, you are only required to test the endpoints relating to the data sources that your software supports. Where your software doesn’t support all data items, notify [SDSTeam@hmrc.gov.uk](mailto:SDSTeam@hmrc.gov.uk) separately to confirm which data items you do support, so we can take this into account when checking the testing logs.

[Fraud prevention headers](/guides/fraud-prevention/) must be included in sandbox calls. A specialist team will check these and they must be confirmed as compliant before we can proceed.

After testing is complete, send details of the dummy NINO used to call the above endpoints in sandbox to [SDSTeam@hmrc.gov.uk](mailto:SDSTeam@hmrc.gov.uk). You will need to contact us within 14 days of completing your API testing to enable us to view the data within our logs. SDST will advise you of the outcome of our checks within 10 working days.  

After we are satisfied that the relevant APIs and endpoints have been tested satisfactorily and that calls include compliant fraud prevention headers, you will be invited to demonstrate your product.

**Note:** Demonstration is not generally required for access to updated APIs (that is, new versions), but satisfactory testing will be required.

### Terms of use

You must comply with our [terms of use](/api-documentation/docs/terms-of-use). You must accept the terms of use before we can issue you with production credentials.

### Product demonstration

This is the final part of the process after all preceding steps have been completed.  

During your product demonstration, HMRC expects to see a consumer-ready product for each income source your software supports; for example, Self-employment, UK property, and so on. If, in addition to the MFS APIs, you have also requested access to any non-MFS APIs, you should be ready to include these in your demonstration if requested to do so by SDST.

The journey we expect to see for an MFS build will depend on whether you are building iteratively and if so, which stage you have built to:

**Stage 1: In-year build**

1. Authorisation – ITSA scopes only.
2. Retrieve Business Details.
3. Retrieve Obligations.
4. Digitally import data into the appropriate periodic update and submit.
5. Automatically trigger and display a tax calculation.
6. Submit an amended periodic update – automatically trigger and display the calculation.
7. Demonstrate how your software returns and displays error messages to the customer.

**Stage 2: EOPS**

1. Submit details within the Annual Summary.
2. Automatically trigger and display a tax calculation.
3. Trigger a Business Source Adjustable Summary (BSAS).
4. Retrieve a BSAS.
5. Create and submit a Business Source Adjustable Summary for an accounting adjustment.
6. Automatically trigger and display a tax calculation.
7. Retrieve a Business Income Source Summary (BISS) and display it to the customer. Alternatively, the software may choose to create a BISS themselves by totalling the relevant information held in software and displaying it to the customer.
8. Show EOPS Declaration Statement.
9. Submit EOPS.
10. Demonstrate how your software returns and displays error messages to the end user.

**Note:** The end user must confirm they have read and agreed the declaration statement before the option to submit EOPS is made available.

**Stage 3: Final Declaration**

1. Create and submit a loss.
2. Create/Amend and submit disclosures (Class 2 NICs).
3. Trigger a tax calculation with the Final Declaration parameter set to ‘true’.
4. Retrieve and display this tax calculation for the customer to review.
5. Show the Final Declaration Statement – this must match the statement shown on the ITSA End to End Service Guide.
6. Submit a Final Declaration.
7. Demonstrate how your software returns and displays error messages to the end user.

**Note:** The end user must confirm they have read and agreed the declaration statement before the option to submit the Final Declaration is made available.

## Software choices

Software Choices is a service designed to help users [find compatible software for Making Tax Digital for Income Tax (GOV.UK)](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax) that meets their needs.

An updated version is being developed with filters to help users find products that fit their specific requirements. For instance, a user may wish to find bridging software instead of a standalone product, or a product that suits their accessibility needs. It will also include a filter to find software that is also compatible with Making Tax Digital for VAT.

Software providers have the option for their software to be listed on [software choices](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax) as [software in development](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax#software-in-development) after production credentials have been approved. To be listed as [software available now](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax#software-available-now), providers must demonstrate that they: 

- have developed to minimum functionality standards, by being granted access to the full set of APIs listed in the [minimum functionality standards](#minimum-functionality-standards) section
- can complete the successful onboarding for a customer - sign up, authorise software, and retrieve obligations
- can submit a periodic update for a customer for each business income source

HMRC staff will monitor this activity in real time if they feel it is necessary. HMRC will then perform final checks before allowing a software product to be listed on [GOV.UK](https://www.gov.uk/).

We advise customers to speak to their appointed tax agent (if they have one) before making a decision on software.

### Free-to-use software

The government has committed to the availability of free software for small businesses mandated to use MTD for income tax. HMRC strongly encourages all developers to consider producing a free version of their MTD for Income Tax product for this customer group.

By ‘small businesses’, we mean that eligibility for free software will apply if the business meets all of these conditions:

- is an individual (self-employed or a landlord) or a simple partnership
- is not VAT registered
- has no employees
- has a turnover (gross annual income from all business sources) of less than £85,000
- uses cash basis accounting

For the avoidance of any doubt, there is no expectation that a free product will include VAT, Corporation Tax or PAYE functionality.

In addition to the minimum standards set out in the terms of use, and the general functionality standards applicable to all Income Tax (Making Tax Digital) software, we expect any free software product you provide to small businesses to:

- enable the provision of a dataset that correlates to the current [SA103S self-employment supplementary page (short)](https://www.gov.uk/government/publications/self-assessment-self-employment-short-sa103s)
- enable the provision of a dataset that correlates to the current [SA105 UK property](https://www.gov.uk/government/publications/self-assessment-uk-property-sa105) or [SA106 foreign property](https://www.gov.uk/government/publications/self-assessment-foreign-sa106) pages, where the number of properties does not exceed one
- provide a reasonable level of guidance, help and support to users (HMRC is open to views on what might be ‘reasonable’ for a free product and will publish further advice on this in due course)
- allow the end user to own and have access to all their records created using the software product (past and present) to enable them to retrieve data and promptly export it if necessary
- be free for the business to use to comply with their MTD for Income Tax obligations for a full annual accounting period on the understanding the business continues to meet the eligibility criteria below

HMRC would not require free software to link or integrate with an Agent product.

## Supporting customers in MTD

The customer support model guides HMRC customers to the most appropriate support. Check [GOV.UK](http://gov.uk/) and the software provider's guidance first.

Customers who have signed up to the MTD pilot can get support by contacting the dedicated Customer Support Team on 0300 322 9619 from 8am to 6pm Monday to Friday. 

The team aims to respond to queries that are not resolved at the point of contact within 2 days, and to provide further updates, if required, within 10 days.

## API lifecycle and deprecation

Each Income Tax (Making Tax Digital) API follows a lifecycle from the point where it is first published to the point where it is retired.

More specifically, every version of each API follows a lifecycle. Different versions of the same API can be at different points in the lifecycle. For example, v1.0 might be retired, v2.0 might be stable and v3.0 might be in beta.

### API status

The following table provides details about possible API statuses.

| Status | Meaning | Documentation visible? | Can be subscribed to in Developer Hub? | Endpoints enabled? |
| --- | --- | --- | --- | --- |
| Alpha| Early prototype - documentation only, available in External Test. Intended for feedback about the initial API design and documentation. Expect breaking changes and behaviour changes. | Yes | No | No |
| Beta | Live service but not stable. Breaking changes and behaviour changes are possible. | Yes | Yes | Yes |
| Stable | Stable live service. No breaking changes and only minor behaviour changes. | Yes | Yes | Yes |
| Deprecated | Set to be retired, either because a new version of the API is available or because the API is no longer supported. If applicable, a new version of the API will be available in external test when the current version is deprecated. | Yes | No | Yes |
| Retired | API is no longer in use. | No | No | No |

### Breaking changes

Any change that might break software that relies on an API is counted as breaking change.

The following table  lists changes that we consider breaking. 

| Area | Breaking changes |
| ---- | ---------------- |
| Query Parameter | <ul><li>Adding mandatory query parameter</li><li>Removing a query parameter</li><li>Renaming a query parameter</li><li>Changing an optional query parameter to be mandatory</li><li>Removing/renaming a value from an enum</li></ul> |
| Request Body | <ul><li> Adding a mandatory field </li><li> Removing a field </li><li> Renaming a field </li><li> Changing an optional field to be mandatory </li><li> Removing/renaming a value from an enum</li></ul> |
| Response Body | <ul><li> Removing a field </li><li> Renaming a field </li><li> Changing a mandatory field to be optional </li><li> Adding/renaming a value to an enum</li></ul> |
| Other | <ul><li> Changing the URL of the endpoint </li><li> Removing a resource/endpoint </li><li> Changing the semantics of a field value (for example, the value returned changes from inclusive of VAT to exclusive of VAT) </li><li> Changing validation to have stronger constraints</li></ul> |

#### Changes to errors

When we make changes to errors, we will not usually change the JSON structure returned. In the rare case when this is necessary, this will be considered a breaking change. The values of the error fields may change. 

The following table outlines which types of changes to errors are treated as breaking changes and which are not.

| Breaking changes for errors | Non-breaking changes for errors  |
| --------------------------- | -------------------------------- |
| Changing the HTTP status code to a different value | Removing an error code |
| Renaming an error code | Changing the message of an error |
| Adding a new error code (but see below) | |

If we add a new error code to an endpoint as part of a new field/object, which is not itself a breaking change, the new error is not counted as a breaking change.

For example, if we add a new optional string field to the request body and the field must satisfy a specific condition (otherwise, it fails with a new error), this error is not considered a breaking change because existing software will keep functioning as the error can be returned only if the new field is used.

### Deprecating APIs

If an API has been in production with a status of 'Stable', we aim for a deprecation period of 6 months. 

For an API in beta, we aim for a deprecation period of 6 weeks minimum.

Applications cannot subscribe to a deprecated API version, but can still call the API version if the subscription was made before the status changed.

The status of APIs is indicated in the API documentation. 

### Indicating deprecation in headers

For releases after January 2024, when an endpoint becomes deprecated, it will return the following response headers.

| Name | Meaning | Example value |
| ---- | ------- | ------------- |
| Deprecation | The deprecation date/time for this endpoint, in IMF-fixdate format. | `Sun, 01 Jan 2023 23:59:59 GMT` |
| Sunset | (optional) The earliest date/time this endpoint will become unavailable after deprecation, in IMF-fixdate format. | `Sun, 02 Jul 2023 23:59:59 GMT` |
| Link | Documentation URL for the relevant API | `https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api` |

The 'Sunset' header contains the earliest date/time that the endpoint could be retired after being deprecated. Do not rely on the availability of the endpoint after this.

The 'Sunset' header may not be returned in some rare cases, such as when the retirement date for an endpoint is uncertain.

#### Older deprecation headers

In previous releases, deprecation status could be indicated with a 'Deprecation' response header like this.

| Name | Example value |
| ---- | ------------- |
| Deprecation | This endpoint is deprecated. See the [API documentation](/api-documentation/docs/api/service/self-assessment-bsas-api/). |

**Note:** This was implemented only for the Business Source Adjustable Summary API.

### Retiring APIs

After an API has been deprecated for the amounts of time indicated above, it can be retired and the endpoints and documentation will be removed. Ensure that your application does not rely on any deprecated APIs.
