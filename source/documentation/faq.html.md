---
title: Frequently Asked Questions
weight: 50
---

# Frequently Asked Questions #

**1. Where taxpayers are submitting quarterly updates under MTD, can they still submit Self-Assessment returns for their non-business returns, or do they have to submit non-business income via MTD APIs?**

No, they won't have to submit SA returns as well. They can choose whether to use MTD to submit non-business income. If software doesn't support this, then a customer can provide this information to HMRC using the HMRC Update and Submit service. It is not mandatory to submit this income through software, but your software may choose to support the full end-to-end customer journey.

**2. Will the non-business income MTD service be available to be added to gov.uk verify and/or government gateway accounts?**

We have the view and change MTD services currently. Customers will be able to access their submission services from there.

**3. Will the Tax Calculation API have one endpoint for the calculation and another for any errors?**

Currently the design will have this calculation and error messages.

**4. Will Individual Calculations (MTD) API return data for all calculation IDs or only latest?**

There is a List All Self-Assessment Calculations endpoint within the Individual Calculations (MTD) API that will return all calculation IDs for all calculations performed in previous years by entering a date parameter on the call. You can then use the other endpoints within the Individual Calculations (MTD) API to retrieve the details.

**5. Will this updated roadmap be shared with the developer community?**

Yes, we will share this when we get new iterations. We will provide a timeline for when you can expect an updated roadmap.

**6. At the moment the sandbox API returns a lot of canned data. When can we expect end points to be fully functional? For example being able to trigger SA Tax Calculations and then retrieve those calculations.**

There are no plans to make endpoints fully functional as in the live environment.

Currently, the majority of our APIs do not have stateful stubs. The reason for not supporting stateful stubs is due to the complexity of creating, maintaining and ensuring consistency across our API suite and the limited availability of backend systems in test environments such as the sandbox (an integration environment, and not a production copy with all the backend systems in place).

**7. On the control slide, you state the earliest tax year that certain income types will be supported. For those income types supported from 2021/2022, when will it be possible to register those users for MTD? Given they need to be registered in advance of the year commencing.**

Those income types would be supported from 2021/2022, there will be further guidance from HMRC for when people need to sign up.

**8. Is there a website discussion forum where detailed technical development questions can be discussed and shared by this community in order to help each other?**

No, instead we have created a MTD newsletter to provide all information that we think will be useful. This will be shared across the software developer community. Please suggest any feedback of what you would like to see in this newsletter to the Software Developer Support Team mailbox.

**9. Can you confirm if periodic updates can be posted on the sandbox and if so what business/employment do you use. We get the error that matching resource cannot be found.**

Yes you can, if it is not working then you may be using the wrong API. Please see the [End to End Service Guide](/documentation/businessandpropertyincome.html#submit-income-and-expense-updates-for-self-employment-and-property-businesses).


In order to post periodic updates in Sandbox for self-employment and UK property, a business has to be added using the "Add a self-employment business [test support]" and "Add a UK property business [test support]" endpoints within the Self-Assessment (MTD) API.

The "selfEmploymentId" that is returned from the "Add a self-employment business [test support]" call is then used when posting the self-employment periodic update.

**10. It seems you are relying solely on the software community to recruit eligible 'customers' to partake in the pilot. As you have access to a database that contains a list of every eligible customer, what activities will you be doing to promote and recruit customers yourselves to join the pilot?**

This is not the case; we are developing plans on our engagement with customer segments and how we can use external stakeholder groups to disseminate messages for the ITSA pilot. At the moment it makes sense that we are reaching out to software developers to increase the number of compatible products, but this is expanding to other segments.

**11. On the pilot, has there been consideration into breaking the requirements down? i.e. can software providers join the pilot just for quarterly updates to start with?**

At the moment no, as we have not granted production credentials, but we are looking to see how we can make this work and we are considering it.

**12. On MTD ITSA software compatibility page the names of the sections “software available” and “software in development” are slightly misleading. Products listed in “software in development” section have been granted production credentials and can be used in production. Could the “software in development” section be renamed to reflect the fact that products in this section are production ready? This will add more confidence for the customers joining the pilot.**

In general, the current Software Choices page is being looked at. We are looking to develop a more interactive software choices viewer.

**13. I have a question regarding income from employment. Who is actually responsible for providing this income for a person via MTD? The employer or the employee?**

Employment income is not mandated to be provided by MTD. The employer, if you support employment it would be advisable to support endpoints, but it will come from the employer end year. HMRC will use the employment income provided by the employer and include the year-to-date employment income in the in-year tax calculation and the end of year employment income in tax calculations provided after the tax year has ended.

The employment endpoints are held in the "Individuals Income Received (MTD) API" and these can be used to check and correct the information after the tax year has ended. So, if you support employment income it is advisable to support the appropriate endpoints.

Please see [further guidance](/documentation/additional-income.html#employments).

**14. Should the wording be changed to tax period, rather than annual accounting period, given the change of submissions to a tax year basis?**

We are aware that we need to make terminology as simple as possible. We are trying to include software developers in this. There are some terms that you should see soon that are changing to make it more customer friendly. Happy to receive feedback to understand what works.

**15. Is the Agent Auth API in sandbox fully testable now? (i.e. last I used this API, as a client, I was not able to accept OR cancel an invitation from my agent to act on my behalf).**

The Agent Authorisation API along with the Agent Authorisation Test Support API (which is used to provides test-only ability to accept or reject an authorisation request created with Agent Authorisation API) is working in the sandbox environment.

**16. At the moment you cannot register a user for MTD via API, is this going to be a requirement?**

There are no plans to deliver a third-party API sign up solution, this has been ruled out by security.

**17. Where can I find accurate and usable documentation so that I can build my software?**

HMRC provides the documentation you need to help build a product. The easiest way to access this, and make sure you are up to date with latest announcements and developments is to [register with HMRC as a software developer](https://www.gov.uk/government/collections/register-as-a-software-developer).

**18. Where can I test my software properly and for all user types so that I am confident to deploy it?**

HMRC provides a testing platform to registered software developers. This [page](https://www.gov.uk/government/collections/register-as-a-software-developer) explains how you register and from there obtain documentation that explains how to access the testing platform.

**19. Is registering a customer for MTD via APIs and adding a self-employment/property business via API going to be available in production in future?**

There are no plans to deliver a third-party API sign up solution, this has been ruled out by security.

**20. Will HMRC be sharing their roadmap for communications? As software providers we will be more than happy to help with getting the message out there but that will still leave people who don't use software or use Accountants unaware of MTD?**

Yes, we will share this when we get new iterations. We will provide a timeline for when you can expect an updated roadmap.

**21. Will the non-business income MTD service be available to be added to gov.uk verify and/or government gateway accounts?**

We have the view and changed MTD services currently. Customers will be able to access their submission services from there.

**22. If a taxpayer submits quarterly updates and EOPS via MTD, can they submit a Self-Assessment return via XML instead of a Final Declaration?**

During the pilot the customer can revert back to submitting an SA return however, all information for that financial year must be included as the information submitted in SA will overwrite the information in MTD. Once mandated the customer will be unable to submit an SA return.

**23. To meet the requirements for the list we must successfully complete a periodic return for 2 unique customers, could you confirm if the periodic return is a quarter or could this for example be one day?**

The periodic return can be a daily submission yes, as interacting with the APIs in the live environment is the same if you are entering data for a day, week, month etc.

**24. With regards to the BusinessID field, as this is a 15-digit field for individuals with more than one source of business income will this be clear each time which business this relates to? Will the individual be given the ID at point of registration?**

At sign up the trading name is captured; users will use this to distinguish between multiple self-employment sources. Business ID is not given to the customer.

**25. It would be useful to be able to add taxpayers with non-mandated income types into the pilot if they are only going to report non-mandated items at the end of the year.**

We are approaching this pilot in a very controlled manner, so if we know that a customer has (for example) capital allowances, we know they might only report this at the end of the financial year, in which case we could look to bring a customer in with income types we want to prove in the service, and capital allowances, on the understanding that this is due to be delivered before it needs to be reported at the year end. We will work very closely with the developer community to set these clear expectations when we bring customers into the pilot.

**26. As it stands when the version number of a subscription is increased then an MTD supplier needs to subscribe to the new version number. This normally means not much more than changing the Accept header for a different version number. However, this means there is a need for HMRC to review test data (in production). This therefore makes updating a version number quite a considerable amount of effort for HMRC. Hence it will cause problems when there are lots of suppliers. Could I suggest that you change this to automatically allow suppliers to subscribe to the next version number of any one subscription. Otherwise end users will encounter considerable delay.**

We take on the feedback and appreciate your concerns however the process has been designed to provide assurance for any situation. The time taken to check testing logs for a version change is not too onerous, so we are happy to maintain this way of working on SDST. We will, however, keep this feedback in mind when reviewing the process in future.

**27. Why wouldn't customers avoid software and just use submission service?**

Currently, non-MTD ITSA customers can interact with HMRC without procuring third party software. This is not the case for MTD. Customers with business income that aren’t mandated can voluntarily join MTD. However, if they do, they will have to procure third party software.

**28. The 'Income Tax View & Change Service' is the 'free' software and could be used with Bookkeeping Software that do the quarterly Reporting. This will then complete with some of the potential products in the market.**

The Update and Submit an Income Tax Return service is designed to be a safety net and not as competition to your products. All MTD customers will need to procure third party software to comply with their MTD obligations. However other software developers might not build the functionality for the full customer journey for every income type. So the Update and Submit an Income Tax Return service is to service their needs. Customers without business income cannot join MTD so will not have access to the Update and Submit an Income Tax Return service.

**29. Can users submit business information through the submission service? Can users mix and match, submitting some data through 3rd party software and other data through the submission service?**

The legislation requires a customer in the MTD ITSA service to keep digital records and report using third party software; there has been no change to this requirement. A customer reporting their business income via software can choose to report non-business income via the Update and Submit an Income Tax Return service offered by HMRC. However, HMRC believes the best customer experience is afforded by reporting everything via one channel (software), and we expect the majority of customers with both business and non-business income sources to want products that offer this.

**30. Can HMRC use the submission service to test the non-business APIs and identify bugs/live service issues? So software providers can be more confident about the APIs.**

Yes, we would welcome users into the service at the earliest opportunity to test functionality and rectify any issues, should there be any.

**31. Any chances to make the HMRC submission service available in Sandbox environment - and connected to ITSA APIs? In this way it would be possible for ISV to have aggregated data view for APIs they plan/ not plan to develop.**

This is not part of HMRC's plans, we will continue to share our roadmap which will continue to inform vendors of what data sets live and planned for future delivery.

**32. Are there plans to retire the solution (HMRC submission service) after time as with FBI (file-by-internet)?**

At present the legislation stipulates that it is not mandatory to report non-business income via software. Therefore, we need to offer this channel should a customer require this. If there is a change to that legislation in the future, then the need for the service will be reviewed.

**33. Is the intention for the HMRC Update and Submit an Income Tax Return service to become available to taxpayers who have no mandated income? i.e. those that would not be caught by MTD because they have no or little self-employment and property income. If not, what is the longer-term solution for those taxpayers?**

There are no plans to do this at the moment. The long-term future of the ITSA online filing service is outside the remit of the MTD Programme.

**34. Does HMRC have a preference on how the NINO should be sent to them (in line with data protection compliance)?**

We are looking at the most appropriate way to do this to ensure GDPR is adhered to.

**35. The definition of customer in point 2 can be different. How would that work for an accountant wanting to sign-up their client through a software vendor?**

We can support both individuals and agents with our sign-up service, and we are happy to handhold both in the early stages of the pilot.

**36. Will users be able to make a calendar election at this point (to align quarters to months rather than the 5th of the quarter)?**

We're still working through the design and build of the calendar quarter election. Once that work is complete, we will be able to consider how that fits into the MTD sign up journey.

**37. I'm assuming the clients/agents will need an MTD ASA prior to completing this sign-up journey?**

Agents must create an ASA in order to access any MTD services on behalf of clients including sign up. Agents must have client authorisation in place before signing up clients, agents can either copy an existing authorisation or request their client to authorise them using their ASA.

**38. My product is WCAG 2 but only based on automated tools which I've used. Is there any way that HMRC could provide direct accessibility support? i.e. their working group do some accessibility testing on our products? That way we can get some real-world feedback. Also, 336k don't speak English as their primary language. What language is most common? Could a translation option be a filter on the Software page as well as accessibility?**

HMRC are not able to provide accessibility testing/auditing of 3rd party MTD products. GOV.UK has guidance and tools for digital accessibility which can be accessed - please go to GOV.UK and search 'Digital Accessibility'. Please note that these tools may make reference to building for public sector websites and apps - whilst 3rd party software specifically for the Making Tax Digital programme is not classified as a public sector website or app; the information contained within the guidance is still relevant and can provide useful resources for making programmes accessible and inclusive, designing accessible services, designing accessible content, testing accessibility and producing accessibility statements.

In terms of primary language, in the 2011 Census, Polish was the most common language after English. After Polish the next most common main languages were from South Asia, Panjabi and Urdu. We will pass your suggestion regarding a translation filter onto the design team who own the 'Find software that's compatible with Making Tax Digital' pages.

**39. Could you provide an example, in the HMRC space, of a product with accessibility features?**

The following accessibility statements explain how accessible a service is, what to do if you have difficulty using it, and how to report accessibility problems with the service.

Accessibility statement for Signing up to Making Tax Digital for VAT service - <https://www.tax.service.gov.uk/accessibility-statement/vat-sign-up>

Accessibility statement for Claim a tax refund service - <https://www.tax.service.gov.uk/accessibility-statement/claim-a-tax-refund>

**40. Could the documentation tell us more about how the access token is checked to be valid? (i.e. If I'm in a time zone of UTC+2 for example, how does the HMRC server check that such access_token is valid when the server receives it)?**

HMRC generates the access token (in UTC) and it expires 4 hours later (also in UTC). So it doesn't matter what time zone the software is running in, or what time zone of the request originates from etc.

**41. Could the HMRC sandbox server have options to return more than 1 piece of data (i.e. listing businesses from Business Details API only returns 1 company called Company X, could we have an option for 2 or more companies?).**

We can add additional GOV_TEST scenarios to provide more than one company. This will be placed on the backlog and prioritised into a sprint.

**42. Despite all the canned data, in terms of functionality, how close is Sandbox to PROD? 90%, 95%?**

With respect to code functionality exactly the same between Sandbox and Production. As our endpoints are stateless, data between the two environments will differ.

**43. At the moment you cannot register a user for MTD via API - is this going to be a requirement?**

There are no plans to deliver a third-party API sign up solution, this has been ruled out for security reasons.

**44. I notice the API roadmap has dated milestone to August 2022. I presume all functionality will be built in by that point? Is it possible to have dated aspirational milestones for beyond 8/22?**

That is all we are able to say at this stage, but we will provide further information when we can.

**45. Since those steps are not in the slides and is a live demo, could we get those steps written somewhere (maybe as a BPMN diagram)? I find them really useful to filter existing client that might be eligible at our end.**

Please see the attached journeys for both individuals and agents. Note that these designs are likely to be iterated and timelines are indicative at this stage.

**46. Will HMRC be using MTD or Making Tax Digital, just so we can ensure we are aligned to the same messaging?**

We will be using Making Tax Digital.

**47. Are eligibility restrictions (for pensioners) likely to be dropped for year 2022-2023?**

We will be targeting customers with pensions during the first quarter of 2022/2023. Once proven, restrictions will be lifted for pension income sources.

**48. Does a customer have to have either a Property or Self Employment business (or both) to be eligible for sign up for MTD ITSA in the first place?**

Currently, a customer must have one or more mandated income sources to sign up for the MTD for Income Tax Pilot.

**49. Will HMRC be providing its own free software product?**

HMRC has always been clear that it has no plans to provide any software products for MTD but will instead build and make available the Application Programming Interfaces (APIs) that enable the software developer industry to develop and deliver all the required software products for MTD customers, including free software products. 

We encourage developers to consider producing a free version of their MTD for ITSA product for eligible businesses.  But we accept that not all developers will choose to do so.  

**50. Do you expect all ITSA software developers to have a free version for their product?**

We do not expect every developer to offer a free product. However, we encourage developers to consider producing a free version of their MTD for ITSA product for eligible businesses. 

It is not a condition under the Terms of Use of our APIs that there must be a free version of any product. Nor is there any link between the granting of production credentials for MTD ITSA products and the pricing model of a product. 

**51. What does HMRC mean by free software?**

A software product will meet the government’s expectations of free software if it is made available free of charge (at no monetary cost) to eligible business to use to meet their MTD for Income Tax obligations on a permanent basis. 

We believe that this definition aligns the closest with our commitment to help the smallest businesses with the costs of transitioning to MTD, especially those businesses moving to digital record keeping for the first time.

**52. Who is entitled to free software?**

We have been clear that free software will be available to those businesses with the most straight forward tax affairs. The business must: 

* be an individual (self-employed or a landlord) or a simple partnership, 
* not be VAT registered, 
* have no employees, 
* have a turnover (gross annual income from all business sources) of less than £85,000, and 
* be using the cash basis of accounting for income tax.

**53. Could you expand on the £85,000 turnover test?**

The £85,000 turnover threshold reflects the minimum eligibility rules for simplified reporting for businesses with the simplest of accounts (three-line accounts) such as those business entitled to file the current SA103S (self-employment supplementary page) (short) (2021 version). When combined with the other eligibility criteria, this provides a reasonable proxy for the smallest businesses with the most straightforward affairs.

For landlords, the £85,000 test relates to gross income (rents) from property. 

**54. Is there any limit on the number of properties a landlord can have? Why not limit free software to individuals with just one property?**

HMRC agrees that, in the case of landlords, free software is aimed mainly at those individuals with just one property, including the so-called “accidental landlords” e.g. those who have inherited a second property and are renting it out. However, there are many such circumstances, which is why we haven’t tailored the criteria for free software to the number of properties a landlord has.

**55. The product I offer/expect to offer will be free for a trial period only. Is that acceptable?**

For a product to meet the government’s commitment, the product must always be free-to-use. However, HMRC accepts that not every product marketed as “free” will meet the government’s expectations of a free product. 

Some software developers will choose to offer products at a variety of price points including low-cost products, or products where free access is limited for a specified time, or by the number of transactions or users. HMRC welcomes this kind of choice for customers. 

**56. My product is (will be) free but limited by the number of transactions or user interactions – above a certain number, the product will cease to be free. Is that acceptable?**

HMRC notes some software developers will choose to offer products where free access is limited for a specified time, or by the number of transactions or number of users. HMRC welcomes this kind of choice for customers.

**57. What if the user has other income from non-business sources? Will they need to be included in my product’s free offering?**

No.

**58. My product also offers MTD VAT functionality. Does it still need to be free?**

No. If a developer wants to offer such functionality for free, that is a commercial choice. But VAT registered businesses are not the target for free software from the government’s perspective.

**59. What is the approximate population size that will be eligible for free software?**

We estimate there are between 900,000 and a million business that meet the eligibility requirement for free software, but not all customers in this cohort will choose a free product. Many may prefer to obtain a more sophisticated, paid-for product and more will be open to graduating to a paid-for product over time.

**60. I am concerned that the population eligible for free software is too large, which might affect market viability. I would prefer to limit my free offering to a much smaller group, say those with turnover over £10K but up to a maximum of £20k-£25k. Would that be acceptable?**

HMRC welcomes this kind of choice for customers.

**61. The smallest business will still require agent support to for instance cross check their quarterly submissions. Will agents be eligible for free software?**

We do not expect agent-facing software products to be free. 

If a tax agent is merely being given access to the business’s own software, we believe that ought to be possible without necessarily affecting the price of that product. However, HMRC notes that some existing products currently link their pricing model to the number of users of the product. HMRC welcomes this kind of choice for customers.

**62. Do you expect free software to link with an agent’s software?**

There is no requirement for software products to link automatically with that of a tax agent.

HMRC is currently working through its policy on “digital links” where data is transferred from one software product to another (e.g. an agent-facing product). We expect there will be some rules set out in HMRC Notices on how that transfer is affected. But that may be no more onerous than ensuring data held in free software can be downloaded (for example, as a .csv file) for importing into the second product. 

**63. What are the minimum functionality requirements for free software?**

All software products must conform to the Terms of Use of HMRC’s APIs. In addition, MTD ITSA products must meet the minimum functionality standards set out in the [Production Approvals Process section of this guide](/#production-approvals-process-for-making-tax-digital-for-income-tax-self-assessment).

**64. What does HMRC consider to be a reasonable level of help and support for users of a free software product?**

We expect all free software products to include a reasonable level of customer support solutions for eligible businesses. We are open to developer views on what might be ‘reasonable’ help and support for a free product. We accept that this might be different to a paid-for product.

**65. What will happen if no developer chooses to offer a free MTD ITSA product?**

We encourage developers to consider producing a free version of their MTD for ITSA product for eligible businesses and are confident that the market will deliver. But in the event that this doesn’t happen, the government will examine all options to ensure that free products are available.
