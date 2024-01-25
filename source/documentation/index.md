# Income Tax (Making Tax Digital) end-to-end service guide

**Version 3.7** issued January 2024

This service guide explains how you can integrate your software with the [Income Tax (Making Tax Digital) APIs](/api-documentation/docs/api?filter=income-tax-mtd). 

>|Help us improve this guide |
|---|  
|This guide is currently being revised and overhauled to ensure it meets the needs of software providers. See the service guide [changelog](#documentation-changelog) for latest updates.<br/><br/>If there is a way that this guide could be improved or expanded to meet your needs, <b>now is the time to let us know.</b><br/><br/>If you use this guide regularly, we&#39;d like to invite you to share your thoughts and feedback via an online video call, which will involve a 60-minute one-to-one interview.<br/><br/>We’d like to explore:<ul><li>Your current use of and experience with the service guide</li><li>Any challenges you face</li><li>How helpful you find the service guide</li><li>Your thoughts on the current service guide, how it fits your needs and how it can be improved</li></ul><br/>If you would like to help us improve this guide, please contact our User Researcher <a href="mailto:chris.samms@digital.hmrc.gov.uk">chris.samms@digital.hmrc.gov.uk</a> to arrange an interview.|

## Overview

This guide explains how you can integrate your software with our APIs, and provides examples of how they fit into various end-to-end user journeys to enable agents and individuals to meet their obligations once they have signed up to Making Tax Digital, a service where quarterly updates and final declarations will replace the need for a Self Assessment return to be submitted.

For more information about eligibility and how to use Making Tax Digital for Income Tax, please refer to the [Making Tax Digital step by step guidance](https://www.gov.uk/government/collections/making-tax-digital-for-income-tax-for-businesses-step-by-step).

## Software provider overview

HMRC expects software providers to offer customers a streamlined end-to-end journey, and as far as possible, to support all the things the customers need to do to comply with their MTD for ITSA obligations. This will include the ability to finalise the overall tax position using software.

HMRC will provide the APIs for the software to support all of the personal data items that need to be submitted under Self Assessment. Although these elements will not be mandated through the software, there will be market demand for software that enables any user to finalise the entirety of their tax affairs.

By developing a product now, you will support the mandate of the service, influence its design and ensure you have a product ready for the millions of customers that will need MTD-compatible software.

### Bridging software

Some customers may wish to integrate their existing software solution for digital record keeping with another product that can submit quarterly updates, End of Period Statement, view tax liabilities, make a self assessment and final declaration, and so on. We generally refer to these products as bridging products. 

In order to be granted production credentials for a bridging product, it must be digitally linked to software that allows customers to maintain business records required by law.

### Non-MTD products

Software products who wish to selectively use Making Tax Digital for Income Tax APIs and not build a Making Tax Digital product will have to submit a business case, justifying use of a particular or multiple API’s. Such products may be granted production credentials at HMRC discretion.

## Production approvals process for Making Tax Digital for Income Tax Self Assessment

Our key objectives for MTD for Income Tax are to:

* ensure customers have a streamlined end-to-end journey and software that supports everything a business customer needs to do to meet their Income Tax obligations
* safeguard customer data and protect HMRC systems against fraud and criminal attack

This section of the guide explains the features your product must include before production credentials are sought, together with features you should consider building into your products.

### Minimum functionality standards

Previously, the production approvals process included an assessment of whether a product includes certain minimum functionality.

In response to developer feedback, we are content for software developers to build MTD Income Tax products iteratively and be granted production credentials for specific elements of the minimum required functionality. However, an MTD Income Tax product will only be listed on the software choices viewer when it satisfies all the requirements listed below.

The minimum required functionality is as follows:  

* A software product must submit the fraud prevention header data required by law.
* A Making Tax Digital for Income Tax product must allow the customer to:
    * Create and maintain all business records a customer is required by law to keep in digital form (but see [bridging software](#bridging-software))
    * Submit quarterly update information for each business income source (self-employment, multiple self-employments, UK property income)
    * Have the option to provide accounting and other adjustments and an estimate of allowances to be claimed for any business income source
    * Submit an End of Period Statement for each business income source (with declaration of completeness)
    * Call for and view an estimate of their Income Tax liability for each tax year at any time
    * Make a self-assessment of the tax and Class 4 National Insurance contributions due on their total taxable income and a final declaration of completeness and correctness no later than 31 January following the end of tax year in which that income is taxable
    * Carry forward or set sideways (when permitted) business losses occurring in any one year as well as to apply losses incurred in earlier years against current year profits
    * Have visibility of all their Class 2 National Insurance contributions (so that they can make additional voluntary contributions if they wish)

The Making Tax Digital for Income Tax APIs that include the endpoints for the functionality described above are:

* [Business Details](/api-documentation/docs/api/service/business-details-api/)
* [Business Income Source Summary](/api-documentation/docs/api/service/self-assessment-biss-api/)
* [Business Source Adjustable Summary](/api-documentation/docs/api/service/self-assessment-bsas-api)
* [Individuals Business End of Period Statement](/api-documentation/docs/api/service/individuals-business-eops-api/)
* [Individual Calculations](/api-documentation/docs/api/service/individual-calculations-api)
* [Individuals Disclosures (Class 2 NIC’s)](/api-documentation/docs/api/service/individuals-disclosures-api)
* [Individual Losses](/api-documentation/docs/api/service/individual-losses-api)
* [Obligations](/api-documentation/docs/api/service/obligations-api/)
* [Property Business](/api-documentation/docs/api/service/property-business-api/) (only for property full product)
* [Self-Employment Business](/api-documentation/docs/api/service/self-employment-business-api/) (only for self-employment full product)
  
   
### Fraud Prevention Headers

You must supply fraud prevention header information for all our APIs before approval can be granted and production credentials issued.

HMRC must see evidence of fraud prevention headers being sent and be satisfied as to their level of accuracy.

The developer must test their fraud prevention headers and provide SDST with screenshot evidence that the correct response is received from the [Test Fraud Prevention Headers API](/api-documentation/docs/api/service/txm-fph-validator-api/). [Guidance on Fraud Prevention Headers](/guides/fraud-prevention/) is available.

### Overview of developer journey to production credentials

1. Sign in to the [developer hub](/api-documentation) and register your application for sandbox testing.
2. [Create a test user which is an individual](/api-documentation/docs/api/service/api-platform-test-user/1.0/oas/page#tag/create-test-user/operation/Createatestuserwhichisanindividual) to create test data.
3. Review the [API documentation](/api-documentation/docs/api?filter=income-tax) and Income Tax end-to-end service guide.
4. Test ITSA endpoints and develop your software application. Any queries during this phase should be sent to SDSTeam@hmrc.gov.uk.
5. Register your application for production credentials by creating a production application within your developer hub account and completing the requested sections.
6. Provide testing logs and credentials used for testing to HMRC.
7. Developer testing is reviewed by HMRC (including fraud header validity). 
    - If satisfactory, you will be invited to demonstrate your product. 
    - If not satisfactory, further testing and development will be required for review.
8. The software vendor demonstrates its software to HMRC via online screen sharing.
9. Production credentials are issued if all requirements are met. If not, further development is required and a new demonstration will be arranged.

### Product build

Developers have the option to either build all elements required to meet [minimum functionality standards (MFS)](/guides/income-tax-mtd-end-to-end-service-guide/#minimum-functionality-standards) in one go or to build these elements iteratively. If you choose to build iteratively, you will be required to demonstrate your product after each stage of the build. There are three stages, although many developers choose to develop stages 2 and 3 together. 

The three stages are:

1. In year functionality (submitting periodic updates).
2. End of Period (EOPs).
3. Final declaration.

The [API catalogue](/roadmaps/mtd-itsa-vendors-roadmap/#apis-required-for-each-stage-of-development-of-a-minimum-functionality-standard-mfs-product) shows which APIs are required at each stage of the build.

### Testing requirements

HMRC requires the software to test all the APIs that they require access to. The following points relate to access to both new API subscriptions and version updates of existing API subscriptions:

- For APIs included in the [minimum functionality standards](/guides/income-tax-mtd-end-to-end-service-guide/#minimum-functionality-standards), you are required to test all endpoints shown within the documentation.
- For APIs not included in the minimum functionality standards, you are only required to test the endpoints relating to the data sources that your software supports. Where your software doesn’t support all data items, please notify SDSTeam@hmrc.gov.uk separately to confirm which data items you do support, so we can take this into account when checking the testing logs.

[Fraud prevention headers](/guides/fraud-prevention/) must be included in sandbox calls. A specialist team will check these and they must be confirmed as compliant before we can proceed.

Once testing is complete, please send details of the dummy NINO used to call the above endpoints in sandbox to SDSTeam@hmrc.gov.uk. You will need to contact us within 14 days of completing your API testing to enable us to view the data within our logs. SDST will advise you of the outcome of our checks within 10 working days.   

Once we are satisfied that the relevant APIs and endpoints have been tested satisfactorily and that calls include compliant fraud prevention headers, you will be invited to demonstrate your product. Please note, demonstration is not generally required for access to updated APIs (that is, new versions), but satisfactory testing will be required.

### Product demonstration

This is the final part of the process after all preceding steps have been completed.   

During your product demonstration, HMRC expects to see a consumer-ready product for each income source your software supports; for example, Self-employment, UK property, and so on. If, in addition to the MFS APIs, you have also requested access to any non-MFS APIs, you should be ready to include these in your demonstration if requested to do so by SDST.

The journey we expect to see for an MFS build will depend on whether you are building iteratively and if so, which stage you have built to:

**Stage 1: In year build**

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
7. **Either:** 
    - Retrieve a Business Income Source Summary (BISS) and display it to the customer. 
    **Or:** 
    - The software may choose to create a BISS themselves by totalling the relevant information held in software and displaying it to the customer.
8. Show EOPS Declaration Statement - this must match the statement shown in the ITSA End to End Service Guide.
9. Submit EOPS.
10. Demonstrate how your software returns and displays error messages to the end user.

**Note:** The end user must confirm they have read and agreed the declaration statement before the option to submit EOPS is made available.

**Stage 3: Final Declaration**

1. Create and submit a loss.
2. Create/Amend and submit disclosures (Class 2 NICs).
3. Trigger a tax calculation with the ```finalDeclaration``` parameter set to “True”.
4. Retrieve and display this tax calculation for the customer to review.
5. Show the Final Declaration Statement – this must match the statement shown on the ITSA End to End Service Guide.
6. Submit a Final Declaration.
7. Demonstrate how your software returns and displays error messages to the end user.

**Note:** The end user must confirm they have read and agreed the declaration statement before the option to submit the Final Declaration is made available.

#### Important Considerations

- Build functionality to allow business customers to report income from non-business sources that meets your customer model.
- Consider the one-hour delay as part of the software workflow to update the status of obligations.
- Consider a 5-second delay before retrieving the calculation.
- Consider developing guidelines within the software for relevant users, including a reference to HMRC user interface journeys for customers and agents.
- Use APIs as efficiently as possible to avoid exceeding the rate limit.
- Build relevant error responses for your software to deal with exceptions.
- Correct MTD gateway credentials or agent services credentials need to be used when logging into the system when authorising your software.
- Consider providing notifications to customers when periodic submissions are due.
- Consider building functionality that allows the customer to request a tax calculation at any time.

## Terms of use

You must comply with our [terms of use](/api-documentation/docs/terms-of-use). You must accept the terms of use before we can issue you with production credentials.

## Software choices

Software Choices is a service designed to help users [find compatible software for Making Tax Digital for Income Tax](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax) that meets their needs.

An updated version is being developed with filters to help users find products that fit their specific requirements. For instance, a user may wish to find bridging software instead of a standalone product, or a product that suits their accessibility needs. It will also include a filter to find software that is also compatible with Making Tax Digital for VAT. 

Software vendors have the option for their software to be listed on [software choices](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax) as [software in development](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax#software-in-development) once production credentials have been approved. To be listed as [software available now](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax#software-available-now), vendors must demonstrate: 

- they have developed to minimum functionality standards, by being granted access to the full set of APIs listed in the [minimum functionality standards](#minimum-functionality-standards) section
- they can complete the successful onboarding for a customer - sign up, authorise software, and retrieve obligations
- they can submit a periodic update for a customer for each business income source

HMRC staff will monitor this activity in real time if they feel it is necessary. HMRC will then perform final checks before allowing a software product to be listed on [GOV.UK](https://www.gov.uk/). 

We advise users to speak to their appointed tax agent (if they have one) before making a decision on software.

### Free-to-use software

The government has committed to the availability of free software for small businesses mandated to use MTD for income tax. HMRC strongly encourages all developers to consider producing a free version of their MTD for Income Tax product for this customer group.

By ‘small businesses’ we mean that eligibility for free software will apply where the business meets all of these conditions:

* it is an individual (self-employed or a landlord) or a simple partnership
* it is not VAT registered
* it has no employees
* it has a turnover (gross annual income from all business sources) of less than £85,000
* it uses cash basis accounting

For the avoidance of any doubt, there is no expectation that a free product will include VAT, Corporation Tax or PAYE functionality.

In addition to the minimum standards set out in the terms of use, and the general functionality standards applicable to all MTD for Income Tax software, we expect any free software product you provide to small businesses to:

* enable the provision of a dataset that correlates to the current [SA103S self-employment supplementary page (short)](https://www.gov.uk/government/publications/self-assessment-self-employment-short-sa103s)
* enable the provision of a dataset that correlates to the current [SA105 UK property](https://www.gov.uk/government/publications/self-assessment-uk-property-sa105) or [SA106 foreign property](https://www.gov.uk/government/publications/self-assessment-foreign-sa106) pages, where the number of properties does not exceed one
* provide a reasonable level of guidance, help and support to users (HMRC is open to views on what might be ‘reasonable’ for a free product and will publish further advice on this in due course)
* allow the end user to own and have access to all their records created using the software product (past and present) to enable them to retrieve data and promptly export it if necessary
* be free for the business to use to comply with their MTD for Income Tax obligations for a full annual accounting period on the understanding the business continues to meet the eligibility criteria below

HMRC would not require free software to link or integrate with an Agent product.

## End-to-end user journey

These journeys show examples of use:

* [Income Tax Self Assessment (ITSA) set up activities](/guides/income-tax-mtd-end-to-end-service-guide/documentation/signup.html)
* [retrieving obligations](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#retrieving-obligations)
* [submitting quarterly updates for self-employment and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-quarterly-updates-for-self-employment-and-property-businesses)
* [submitting annual updates for self-employment and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-annual-updates-for-self-employment-and-property-businesses)
* [retrieving a tax calculation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#retrieve-a-tax-calculation)
* [finalising business income End of Period Statement (EOPS)](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#finalise-business-income-end-of-period-statement-eops)
* [providing information about how to treat a loss](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-income.html#providing-information-about-how-to-treat-a-loss)
* [making a final declaration](/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration-crystallisation.html#making-a-final-declaration)

## Changelogs

### API changelog

The full changelog for Income Tax MTD APIs is now at [https://github.com/hmrc/income-tax-mtd-changelog](https://github.com/hmrc/income-tax-mtd-changelog) - that is the best source for detailed and comprehensive information about API changes.

### Documentation changelog

Below is a summary of updates to this service guide:

#### Version 3.8

- Updated the [API Deprecation Guidance](/guides/income-tax-mtd-end-to-end-service-guide/documentation/api-deprecation-guidance.html) section with details of new deprecation headers

#### Version 3.7

24 January 2024

- Updated the following sections of [Business and Property Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html) section:

  - [Retrieving obligations](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#retrieving-obligations)
  - [Submit quarterly updates for self-employment and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-quarterly-updates-for-self-employment-and-property-businesses)
  - [Submit annual updates for self-employment and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-annual-updates-for-self-employment-and-property-businesses)
  - [Submit accounting adjustments](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-accounting-adjustments)
  - [Construction Industry Scheme](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#construction-industry-scheme)
  - [Finalise business income End of Period Statement (EOPS)](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#finalise-business-income-end-of-period-statement-eops)
  - [Retrieve a tax calculation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#retrieve-a-tax-calculation)

- Moved the content of the following sections to other sections in Business and Property Income section:

  -  Business Income Source Summary
  -  View previously submitted updates
  -  Making changes to previously submitted data
  -  Multiple businesses

- Updated the [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/online-tax-account.html) section as follows:

  - updated status of 2 tasks
  - moved [Opting out of MTD](/guides/income-tax-mtd-end-to-end-service-guide/documentation/online-tax-account.html#opting-out-of-mtd) section into HMRC online services section

- Updated the following sections of [Additional Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-income.html) section:

  - [Foreign Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-income.html#foreign-income)
  - [Insurance Policies Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-income.html#insurance-policies-income)
  - [Capital Gains Tax](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-income.html#capital-gains-tax)
  - [Marriage Allowance](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-income.html#marriage-allowance)

#### Version 3.6

13 December 2023

* Updated [Additional Income / Employments](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-income.html#employments) section with off-payroll working details
* Updated [Customer Support Model](/guides/income-tax-mtd-end-to-end-service-guide/documentation/customer-support.html) section
* Updated [Coding Out](/guides/income-tax-mtd-end-to-end-service-guide/documentation/coding-out-underpayments-and-debts.html) section
* Updated UR contact email address

#### Version 3.5

15 November 2023

* Updated content and diagram in [Payments and liabilities](/guides/income-tax-mtd-end-to-end-service-guide/documentation/payments-and-liabilities.html) section
* Removed crystallisation endpoint content from [Final Declaration (Crystallisation)](/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration-crystallisation.html) section

#### Version 3.4

2 November 2023

* Added new [Customer status](/guides/income-tax-mtd-end-to-end-service-guide/documentation/customer-status.html) section describing business purpose of the new Self Assessment Individual Details API
* Updated [Construction Industry Scheme](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#construction-industry-scheme) section and moved it into "Business and Property Income" section
* Updated [Software choices](#software-choices) section
* Updated APIs in [Minimum functionality standards](#minimum-functionality-standards) section
* Removed duplicate "Finalise business income End of Period Statement (EOPS)" section

#### Version 3.3

4 October 2023

* Updated content for [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/online-tax-account.html) section
* Updated content for [Opting out of MTD](/guides/income-tax-mtd-end-to-end-service-guide/documentation/closedown.html) section
* Updated content for [HMRC Assist](/guides/income-tax-mtd-end-to-end-service-guide/documentation/hmrc-assist.html) section

#### Version 3.2

20 September 2023

* Updated content for [Penalties and Appeals](/guides/income-tax-mtd-end-to-end-service-guide/documentation/penalties-and-appeals.html) section
* Updated content for [Final Declaration (Crystallisation)](/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration-crystallisation.html) section
* Updated content for [Production approvals process](#production-approvals-process-for-making-tax-digital-for-income-tax-self-assessment) section
* Updated content for [Software choices](#software-choices) section
* Updated content for [Bridging software](#bridging-software) section
* Removed Business Validation Rules section

#### Version 3.1

27 June 2023

* Added [API lifecycle & deprecation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/api-deprecation-guidance.html) section, removed some duplicated content

#### Version 3.0

14 June 2023

* Updated API and endpoint links.

#### Version 2.9

* Updated direct links to endpoints to reflect changes in how API documentation is published

#### Version 2.8

* Updated HMRC Assist section

#### Version 2.7

* Updated guide to reflect simplified v3.0 Final Declaration process and update section on customers opting out of MTD. 

#### Version 2.6

* Updated guide to reflect API changes including refactored Self Assessment Accounts API.

#### Version 2.5

* Updated guide to reflect new API versions, update links and correct and clarify some content.

#### Version 2.4

* Updated Frequently Asked Questions section to remove some items.

#### Version 2.3

* Added note and an example table demonstrating how adjustments submitted work

#### Version 2.2

* Added a Frequently Asked Questions section to the menu tree

#### Version 2.1

* Notice of version change to Business Income Source Summary V1.0
* "Set up" heading replaced by "Sign up" with the menu tree updated to only have three sections: **Agent**, **Individual** and **Link software to HMRC**.
* Updated content in the **Minimum functionality standards** section with two other sections added: **Bridging software** and **Non-MTD products**
* Updated content in the **Declaration** and **Declaration for agents** sections of **Final declaration** (previously called "crystallisation")

#### Version 2.0

* Addition of Capital Gains Tax, Marriage Allowance, Non-PAYE Income, Coding out underpayments and debts.

#### Version 1.9

* Addition of requirement for businesses and landlords to provide information about residential property disposals
* Addition of information regarding BSAS adjustments
* Addition of content changes to meet MTD Style Guide V2.2
* Replacing the term ‘crystallisation’ with ‘final declaration'

#### Version 1.8

* Addition of deprecation dates for Self Assessment API Endpoints
* Notice of version change to Business Source Adjustable Summary (MTD) - V 1.0
* Notice of version change to Individual Losses (MTD) - V1.0
* Notice of version change to Individual Calculations v 1.0

#### Version 1.7

* Change of title to Income Tax (Making Tax Digital) end-to-end Service Guide
* Inclusion of Income Tax (MTD) APIs
* Inclusion of Tax Terminology
* Addition of Foreign Property reference to Obligations
* Replaced the term, ‘taxpayers’ with ‘customers’
* Replaced references to SA Accounting Summary API with BSAS API

#### Version 1.6

* Revised wording for Draft MTD ITSA Regulations 2021 page.

#### Version 1.5

* Production approvals process for Making Tax Digital for Self Assessment.
* Early draft MTD ITSA Regulations 2021 section added.

#### Version 1.4

* Construction Industry Scheme (CIS) section updated.

#### Version 1.3

* Losses updated.
* Additional income section added.

#### Version 1.2

* Multiple businesses section added.
* Construction Industry Scheme (CIS) section added.

#### Version 1.1

* Payments and Liabilities section added.
