Gravity Books Data Warehouse (SSIS + SQL Server)
This repository contains an end-to-end **Data Warehouse + ETL** project built with **SQL Server (SSMS)** and **SSIS (Visual Studio)**.  
The source system is a **transactional bookstore database (Gravity Books ERD)**, which is transformed into a **star schema** data warehouse with dimensions and fact tables for analytics and reporting.

Project Overview
- **Source**: Transactional schema (books, authors, customers, orders, shipping, addresses, statuses)
- **Target**: Data Warehouse star schema
- **ETL Tooling**: SSIS (Visual Studio)
- **Database**: Microsoft SQL Server (SSMS)

The ETL flow follows:
1. **Extract** from source transactional tables
2. **Stage** raw/cleaned data in staging tables
3. **Load** dimension tables (SCD-ready structure where applicable)
4. **Load** fact tables for orders and order headers

Data Model
Transactional ERD (Source)
See: <img width="1119" height="1247" alt="ERD" src="https://github.com/user-attachments/assets/773ae071-313b-491a-8820-4921ac6489fb" />

Data Warehouse Star Schema (Target)
See: <img width="1458" height="905" alt="Data Model Diagram drawio" src="https://github.com/user-attachments/assets/62b65e50-9626-49c0-b16c-de2d6f7d39cb" />

Warehouse Tables (High-Level)
Dimensions
- `dim_book`
- `dim_author`
- `dim_book_author` (bridge for many-to-many)
- `dim_customer`
- `dim_shipping`
- `dim_order_status`
- `dim_date`

> Notes:
> - Dimensions include surrogate keys (`*_sk`) and business keys (`*_id` or natural keys).
> - Some dimensions include SCD columns like `start_date`, `end_date`, `iscurrent`.

Facts
- `fact_order` (order line grain)
- `fact_orderHeaders` (order header grain / order-level status tracking)

Tech Stack
- SQL Server
- SSMS
- Visual Studio + SSIS (SQL Server Data Tools)

Repository Structure
- `ssis/` : Visual Studio solution + SSIS packages (`.sln`, `.dtproj`, `.dtsx`)
- `sql/`  : SQL scripts to create schemas, staging, dimensions, facts, indexes, and seeds
- `docs/` : ERD and star schema diagrams
- `config/`: configuration templates (no secrets)

Setup & Run
1) Prerequisites
- SQL Server installed and running
- SSMS
- Visual Studio with SSIS/SSDT components installed

2) Create the Database Objects
Run the scripts in `sql/` in order (recommended):
1. Create schemas / staging tables
2. Create dimension tables
3. Create fact tables
4. Create indexes/constraints
5. Seed `dim_date` (if applicable)

> Tip: If you have separate databases for Source / Staging / DWH, adjust the scripts accordingly.

3) Configure Connections (SSIS)
In Visual Studio:
1. Open the solution under `ssis/`
2. Update Connection Managers to point to your local SQL Server instance
3. Prefer using **SSIS Project Parameters** for:
   - Server name
   - Database names
   - Authentication mode (Windows Auth recommended locally)

**Do NOT hardcode passwords in packages.**  
Use SSIS Parameters + Environments (SSIS Catalog) for secure configuration.

4) Execute the ETL
You can run packages from:
- Visual Studio (Debug/Start)
- SSIS Catalog after deployment (recommended for production-like execution)

Recommended execution order (typical):
1. Stage load packages
2. Dimension load packages
3. Fact load packages

Notes on Data Quality & Design Choices
- Surrogate keys (`*_sk`) are used in the warehouse for performance and historical tracking.
- Date dimension provides calendar attributes for reporting (day/week/month/quarter/year and fiscal fields if needed).
- Bridge table supports many-to-many relationship between books and authors.

What to Customize
- Server/DB names in connection managers
- Schema names (if different)
- `dim_date` generation logic (SQL or SSIS)

Future Improvements (Optional Ideas)
- Add logging tables for ETL audit (row counts, duration, status)
- Implement full SCD Type 2 logic for more dimensions
- Add incremental loading strategy (watermarking) for facts
- Add unit test queries / reconciliation checks

## License
Add your preferred license (MIT/Apache-2.0/etc.) in `LICENSE`.
