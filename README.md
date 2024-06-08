# SQL Project: Student Conversion and Engagement Metrics Analysis

This project involves analyzing the student conversion and engagement metrics for a fictional online course platform. The primary goal is to calculate and understand the behavior of students from their initial engagement with the course material to their decision to subscribe for full access.

Project Overview
In this project, we aim to calculate three key metrics:

Free-to-Paid Conversion Rate
Average Duration Between Registration and First-Time Engagement
Average Duration Between First-Time Engagement and First-Time Purchase
Free-to-Paid Conversion Rate
This metric measures the proportion of engaged students who choose to benefit from full course access by purchasing a subscription after watching a lecture. It is calculated as the ratio between:

The number of students who watched a lecture and purchased a subscription on the same day or later.
The total number of students who have watched a lecture.
The result is converted to a percentage and is represented by the field conversion_rate.

Average Duration Between Registration and First-Time Engagement
This metric measures the average duration between the date of registration and the date of first-time engagement. It helps understand how long it takes, on average, for a student to watch a lecture after registration. The metric is calculated as:

The sum of all such durations divided by
The count of these durations, or alternatively, the number of students who have watched a lecture.
The field representing this metric is av_reg_watch.

Average Duration Between First-Time Engagement and First-Time Purchase
This metric measures the average time it takes individuals to subscribe to the platform after viewing a lecture. It is calculated as:

The sum of all such durations divided by
The count of these durations, or alternatively, the number of students who have made a purchase.
The field representing this metric is av_watch_purch.

Data and Methods
The data used in this project is fictional and represents student interactions with an online course platform. The analysis is performed using SQL queries to calculate the metrics based on the provided data.
