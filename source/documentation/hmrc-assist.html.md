---
title: HMRC Assist | Income Tax (MTD) End-to-End Service Guide
weight: 50
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# HMRC Assist
<!--- Section owner: Transactional Risking --->

## Overview

### What is HMRC Assist

As part of Making Tax Digital, HMRC Assist is a set of APIs that will create a better customer experience by prompting customers with help via software they use when submitting quarterly updates.

HMRC Assist will provide guidance and links encouraging customers to get their tax affairs right the first time.  

It will allow customers to:

* correct and understand entitlements and reliefs allowable
* have predictable tax bills
* a better cashflow

### High-level HMRC Assist customer journey

<a href="figures/customer-journey-transactional-risking-high-level.svg" target="blank"><img src="figures/customer-journey-transactional-risking-high-level.svg" alt="High level diagram" style="width:720px;" /></a>

<a href="figures/customer-journey-transactional-risking-high-level.svg" target="blank">Open the high-level diagram in a new tab</a>.

### HMRC Assist endpoints

We are providing two endpoints:

* [Produce a HMRC Assist Report](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/transactional-risking/1.0#Produce%20a%20HMRC%20Assist%20Report) - this endpoint enables a developer to generate and return a HMRC Assist report for a tax calculation for a given customer
* [Acknowledge a HMRC Assist Report](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/transactional-risking/1.0#Acknowledge%20a%20HMRC%20Assist%20Report) - this endpoint enables a developer to acknowledge that the customer or agent has read the given report

### Produce a HMRC Assist Report

The HMRC Assist report is based on the customer’s National Insurance number (nino) and Calculation ID.
The report contains targeted feedback based on what the customer advises HMRC in their update for the given National Insurance number (nino) and Calculation ID.


<a href="figures/customer-journey-transactional-risking-produce-report.svg" target="blank"><img src="figures/customer-journey-transactional-risking-produce-report.svg" alt="Procuce report" style="width:720px;" /></a>

<a href="figures/losses-api-diagram.svg" target="blank">Open the Produce report diagram in a new tab</a>.

A HTTP 200 success code is returned with the targeted message, recommended action and guidance links are within the JSON for the software to display.

### Acknowledge a HMRC Assist Report

This endpoint enables a developer to acknowledge that the given report has been read by either the customer or agent.

<a href="figures/customer-journey-transactional-risking-acknowledge.svg" target="blank"><img src="figures/customer-journey-transactional-risking-acknowledge.svg" alt="Losses API calls" style="width:720px;" /></a>

<a href="figures/customer-journey-transactional-risking-acknowledge.svg" target="blank">Open the Acknowledge diagram in a new tab</a>.


To acknowledge the report, a HTTP 204 code is returned which contains no content.
