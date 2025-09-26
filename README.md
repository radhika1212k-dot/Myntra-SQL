 🛍️  Myntra-SQL 

📌 Overview

The Myntra SQL Project analyzes e-commerce product data (pants collection) from Myntra using SQL queries.
It demonstrates database creation, data import, transformations, and advanced queries to extract insights on pricing, discounts, ratings, margins, and product performance.

---

⚙️ Tech Stack

- PostgreSQL – Database management & queries
- SQL – DDL, DML, and analysis queries
- CSV Dataset – Scraped product data from Myntra

---

📊 Dataset Details

The dataset contains product-level information such as:

- pants_id – Unique product identifier
- brand_name – Brand of the pants
- pants_description – Product details
- price & MRP – Selling price and original price
- discount_percent – Discount applied
- ratings & number_of_ratings – Customer feedback metrics
- cost – Added column to simulate manufacturing/operational cost

---

✨ Key SQL Operations

Database Setup

Create and drop tables (CREATE TABLE, DROP TABLE)

Import data from CSV

Alter table schema (change datatype, add new column)


Core Queries & Analysis

1. Effective Selling Price → Calculate discounted price for products
2. Brand Performance → Aggregate by brand (avg price, avg rating, total ratings)
3. High-Performing Products → Filter by ratings ≥ 3.5 and high review counts
4. Cost Efficiency & Margins → Calculate profit margin and margin % using cost
5. Performance Flags → Categorize products as Top Performer, Good Performer, Average based on ratings & margin %

---

💡 Business Insights

- Identified top brands by total ratings and sales potential
- Highlighted profitable products with high margins
- Segmented products into performance tiers for decision-making
- Detected customer preference patterns based on ratings & discount effectiveness







