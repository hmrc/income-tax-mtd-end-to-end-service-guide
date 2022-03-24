---
title: Frequently Asked Questions
weight: 50
---

# Frequently Asked Questions #

**1. Where taxpayers are submitting quarterly updates under MTD, can they still submit Self -Assessment returns or do they have to submit non-business income via MTD APIs?**

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

**7. On the control slide, you state the earliest tax year that certain income types will be supported. For those income types supported from 2021/2022 , when will it be possible to register those users for MTD? Given they need to be registered in advance of the year commencing**

Those income types would be supported from 2021/2022, there will be further guidance from HMRC for when people need to sign up.

**8. Is there a website discussion forum where detailed technical development questions can be discussed and shared by this community in order to help each other?**

No, instead we have created a MTD newsletter to provide all information that we think will be useful. This will be shared across the software developer community. Please suggest any feedback of what you would like to see in this newsletter to the Software Developer Support Team mailbox.

**9. Can you confirm if periodic updates can be posted on the sandbox and if so what business/employment do you use. We get the error that matching resource cannot be found.**

Yes you can, if it is not working then you may be using the wrong API. Please see the [End to End Service Guide](/documentation/businessandpropertyincome.html#submit-income-and-expense-updates-for-self-employment-and-property-businesses)

In order to post periodic updates in Sandbox for self-employment and UK property, a business has to be added using the "Add a self-employment business [test support]" and "Add a UK property business [test support]" endpoints within the Self Assessment (MTD) API.

The "selfEmploymentId" that is returned from the "Add a self-employment business [test support]" call is then used when posting the self-employment periodic update.

**10. It seems you are relying solely on the software community to recruit eligible 'customers' to partake in the pilot. As you have access to a database that contains a list of every eligible customer, what activities will you be doing to promote and recruit customers yourselves to join the pilot?**

This is not the case; we are developing plans on our engagement with customer segments and how we can use external stakeholder groups to disseminate messages for the ITSA pilot. At the moment it makes sense that we are reaching out to software developers to increase the number of compatible products, but this is expanding to other segments.

**11. On the pilot, has there been consideration into breaking the requirements down? i.e. can software providers join the pilot just for quarterly updates to start with?**

At the moment no, as we have not granted production credentials, but we are looking to see how we can make this work and we are considering it.

**12. On MTD ITSA software compatibility page the names of the sections “software available” and “software in development” are slightly misleading. Products listed in “software in development” section have been granted production credentials and can be used in production. Could the “software in development” section be renamed to reflect the fact that products in this section are production ready? This will add more confidence for the customers joining the pilot.**

In general, the current Software Choices page is being looked at. We are looking to develop a more interactive software choices viewer.

**13. I have a question regarding income from employment. Who is actually responsible for providing this income for a person via MTD? The employer or the employee?**

The employer, if you support employment it would be advisable to support endpoints but it will come from the employer end year. HMRC will use the employment income provided by the employer and include the year-to-date employment income in the in-year tax calculation and the end of year employment income in tax calculations provided after the tax year has ended.

The employment endpoints are held in the "Individuals Income Received (MTD) API" and these can be used to check and correct the information after the tax year has ended. So, if you support employment income it is advisable to support the appropriate endpoints.

Please see [further guidance](/documentation/additional-income.html#employments).

**14. Should the wording be changed to tax period, rather than annual accounting period, given the change of submissions to a tax year basis?**

We are aware that we need to make terminology as simple as possible. We are trying to include software developers in this. There are some terms that you should see soon that are changing to make it more customer friendly. Happy to receive feedback to understand what works.

**15. Is the Agent Auth API in sandbox fully testable now? (i.e. last I used this API, as a client, I was not able to accept OR cancel an invitation from my agent to act on my behalf).**

The Agent Authorisation API along with the Agent Authorisation Test Support API (which is used to provides test- only ability to accept or reject an authorisation request created with Agent Authorisation API) is working in the sandbox environment.

**16. At the moment you cannot register a user for MTD via API, is this going to be a requirement?**

There are no plans to deliver a third party API sign up solution, this has been ruled out by security.

**17. Where can I find accurate and usable documentation so that I can build my software?**

HMRC provides the documentation you need to help build a product. The easiest way to access this, and make sure you are up to date with latest announcements and developments is to [register with HMRC as a software developer](https://www.gov.uk/government/collections/register-as-a-software-developer.).

**18. Where can I test my software properly and for all user types so that I am confident to deploy it?**

HMRC provides a testing platform to registered software developers. This [page](https://www.gov.uk/government/collections/register-as-a-software-developer) explains how you register and from there obtain documentation that explains how to access the testing platform.

**19. Is registering a customer for MTD via APIs and adding a self-employment/property business via API going to be available in production in future?**

There are no plans to deliver a third party API sign up solution, this has been ruled out by security.

**20. Will HMRC be sharing their roadmap for communications? As software providers we will be more than happy to help with getting the message out there but that will still leave people who don't use software or use Accountants unaware of MTD?**

Yes, we will share this when we get new iterations. We will provide a timeline for when you can expect an updated roadmap.

**21. Will the non-business income MTD service be available to be added to gov.uk verify and/or government gateway accounts?**

We have the view and changed MTD services currently. Customers will be able to access their submission services from there.

**22. If a taxpayer submits quarterly updates and EOPS via MTD, can they submit a Self Assessment return via XML instead of a Final Declaration?**

During the pilot the customer can revert back to submitting an SA return however, all information for that financial year must be included as the information submitted in SA will overwrite the information in MTD. Once mandated the customer will be unable to submit an SA return.

**23. To meet the requirements for the list we must successfully complete a periodic return for 2 unique customers, could you confirm if the periodic return is a quarter or could this for example be one day?**

The periodic return can be a daily submission yes, as interacting with the APIs in the live environment is the same if you are entering data for a day, week, month etc.

**24. With regards to the BusinessID field, as this is a 15-digit field for individuals with more than one source of business income will this be clear each time which business this relates to? Will the individual be given the ID at point of registration?**

At sign up the trading name is captured; users will use this to distinguish between multiple self-employment sources. Business ID is not given to the customer.
