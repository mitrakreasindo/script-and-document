﻿-- Bernaridho. 2017-07-27.
ALTER TABLE "Step04A".Breaks ADD CONSTRAINT PK_Breaks PRIMARY KEY (id);

ALTER TABLE "Step04A".Product_Categories ADD CONSTRAINT PK_Product_Categories PRIMARY KEY (id);

ALTER TABLE "Step04A".Closed_Cashes ADD CONSTRAINT PK_Closed_Cashes PRIMARY KEY (money);

ALTER TABLE "Step04A".CSV_Imports ADD CONSTRAINT PK_CSV_Imports PRIMARY KEY (id);

ALTER TABLE "Step04A".Consumers ADD CONSTRAINT PK_Consumers PRIMARY KEY (id);

ALTER TABLE "Step04A".Drawer_Openings ADD CONSTRAINT PK_Drawer_Openings PRIMARY KEY (id);

ALTER TABLE "Step04A".Leaves ADD CONSTRAINT PK_Leaves PRIMARY KEY (id);

ALTER TABLE "Step04A".Removed_items ADD CONSTRAINT PK_Removed_items PRIMARY KEY (id);

ALTER TABLE "Step04A".Locations ADD CONSTRAINT PK_Locations PRIMARY KEY (id);

ALTER TABLE "Step04A".Purchase_orders ADD CONSTRAINT PK_Purchase_orders PRIMARY KEY (id);

ALTER TABLE "Step04A".Payments ADD CONSTRAINT PK_Payments PRIMARY KEY (id);

ALTER TABLE "Step04A".Persons ADD CONSTRAINT PK_Persons PRIMARY KEY (id);

ALTER TABLE "Step04A".Merchants ADD CONSTRAINT PK_Merchants PRIMARY KEY (code);

ALTER TABLE "Step04A".Places ADD CONSTRAINT PK_Places PRIMARY KEY (id);

ALTER TABLE "Step04A".Products ADD CONSTRAINT PK_Products PRIMARY KEY (id);

ALTER TABLE "Step04A".Product_coms ADD CONSTRAINT PK_Product_coms PRIMARY KEY (id, Product, Product2);

ALTER TABLE "Step04A".Product_kits ADD CONSTRAINT PK_Product_kits PRIMARY KEY (id);

ALTER TABLE "Step04A".Promotions ADD CONSTRAINT PK_Promotions PRIMARY KEY (id);

ALTER TABLE "Step04A".Receipts ADD CONSTRAINT PK_Receipts PRIMARY KEY (id);

ALTER TABLE "Step04A".Roles ADD CONSTRAINT PK_Roles PRIMARY KEY (id);

ALTER TABLE "Step04A".Shift_breaks ADD CONSTRAINT PK_Shift_breaks PRIMARY KEY (id);

ALTER TABLE "Step04A".Shifts ADD CONSTRAINT PK_Shifts PRIMARY KEY (id);

ALTER TABLE "Step04A".Stock_Changes ADD CONSTRAINT PK_Stock_Changes PRIMARY KEY (id);

ALTER TABLE "Step04A".Stock_Diaries ADD CONSTRAINT PK_Stock_Diaries PRIMARY KEY (id);

ALTER TABLE "Step04A".Stock_Levels ADD CONSTRAINT PK_Stock_Levels PRIMARY KEY (id);

ALTER TABLE "Step04A".Tax_Categories ADD CONSTRAINT PK_Tax_Categories PRIMARY KEY (id);

ALTER TABLE "Step04A".Taxes ADD CONSTRAINT PK_Taxes PRIMARY KEY (id);

ALTER TABLE "Step04A".Tax_Items ADD CONSTRAINT PK_Tax_Items PRIMARY KEY (id);

ALTER TABLE "Step04A".Third_Parties ADD CONSTRAINT PK_Third_Parties PRIMARY KEY (id);

ALTER TABLE "Step04A".Sales ADD CONSTRAINT PK_Sales PRIMARY KEY (id);

ALTER TABLE "Step04A".Sales_items ADD CONSTRAINT PK_Sales_items PRIMARY KEY (Ticket, line);

ALTER TABLE "Step04A".Vouchers ADD CONSTRAINT PK_Vouchers PRIMARY KEY (voucher);

-- Comment ==================================================================================

ALTER TABLE "Step04A".Product_Categories
 ADD CONSTRAINT FK_Product_Categories 
  FOREIGN KEY (ParentId) 
  REFERENCES "Step04A".Product_Categories (id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE "Step04A".Leaves
    ADD CONSTRAINT FK_Leaves FOREIGN KEY (PplId) REFERENCES "Step04A".Persons (id);

ALTER TABLE "Step04A".Payments
    ADD CONSTRAINT FK_Payments FOREIGN KEY (Receipt) REFERENCES "Step04A".Receipts (id);

ALTER TABLE "Step04A".Persons
    ADD CONSTRAINT FK_Persons FOREIGN KEY (role) REFERENCES "Step04A".Roles (id);

ALTER TABLE "Step04A".Products
    ADD CONSTRAINT FK_Products FOREIGN KEY (PromotionId) REFERENCES "Step04A".Promotions (id);

ALTER TABLE "Step04A".Products
    ADD CONSTRAINT FK2_Products FOREIGN KEY (Category) REFERENCES "Step04A".Product_Categories (id);

ALTER TABLE "Step04A".Products
 ADD CONSTRAINT FK3_Products 
  FOREIGN KEY (PackProduct) 
  REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Products
    ADD CONSTRAINT FK4_Products FOREIGN KEY (TaxCat) REFERENCES "Step04A".Tax_Categories (id);

ALTER TABLE "Step04A".Product_coms
    ADD CONSTRAINT FK1_Product_coms FOREIGN KEY (Product) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Product_coms
    ADD CONSTRAINT FK2_Product_coms FOREIGN KEY (Product2) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Product_kits
    ADD CONSTRAINT FK1_Product_kits FOREIGN KEY (Product) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Product_kits
    ADD CONSTRAINT FK2_Product_kits FOREIGN KEY (Product_kit) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Receipts -- changed references
    ADD CONSTRAINT FK_Receipts FOREIGN KEY (id) REFERENCES "Step04A".Sales (id);

ALTER TABLE "Step04A".Shift_breaks
    ADD CONSTRAINT FK1_Shift_breaks FOREIGN KEY (BreakId) REFERENCES "Step04A".breaks (id);

ALTER TABLE "Step04A".Shift_breaks
    ADD CONSTRAINT FK2_Shift_breaks FOREIGN KEY (ShiftId) REFERENCES "Step04A".Shifts (id);

ALTER TABLE "Step04A".Stock_Changes
    ADD CONSTRAINT FK1_Stock_Changes FOREIGN KEY (Location) REFERENCES "Step04A".Locations (id);

ALTER TABLE "Step04A".Stock_Changes
    ADD CONSTRAINT FK2_Stock_Changes FOREIGN KEY (ProductId) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Stock_Currents
    ADD CONSTRAINT FK2_Stock_Currents FOREIGN KEY (Product) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Stock_Currents
    ADD CONSTRAINT FK3_Stock_Currents FOREIGN KEY (Location) REFERENCES "Step04A".Locations (id);

ALTER TABLE "Step04A".Stock_Diaries
    ADD CONSTRAINT FK2_Stock_Diaries FOREIGN KEY (Product) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Stock_Diaries
    ADD CONSTRAINT FK3_Stock_Diaries FOREIGN KEY (Location) REFERENCES "Step04A".Locations (id);

ALTER TABLE "Step04A".Stock_Levels
    ADD CONSTRAINT FK1_Stock_Levels FOREIGN KEY (Location) REFERENCES "Step04A".Locations (id);

ALTER TABLE "Step04A".Stock_Levels
    ADD CONSTRAINT FK2_Stock_Levels FOREIGN KEY (Product) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Taxes
    ADD CONSTRAINT FK1_Taxes FOREIGN KEY (Category) REFERENCES "Step04A".Tax_Categories (id);

ALTER TABLE "Step04A".Taxes
    ADD CONSTRAINT FK3_Taxes FOREIGN KEY (ParentId) REFERENCES "Step04A".Taxes (id);

ALTER TABLE "Step04A".Tax_Items
    ADD CONSTRAINT FK1_Tax_Items FOREIGN KEY (Receipt) REFERENCES "Step04A".Receipts (id);

ALTER TABLE "Step04A".Tax_Items
    ADD CONSTRAINT FK2_Tax_Items FOREIGN KEY (TaxId) REFERENCES "Step04A".Taxes (id);

ALTER TABLE "Step04A".Sales_items
    ADD CONSTRAINT FK2_Sales_items FOREIGN KEY (Product) REFERENCES "Step04A".Products (id);

ALTER TABLE "Step04A".Sales_items
    ADD CONSTRAINT FK3_Sales_items FOREIGN KEY (TaxId) REFERENCES "Step04A".Taxes (id);

ALTER TABLE "Step04A".Sales_items
    ADD CONSTRAINT FK4_Sales_items FOREIGN KEY (Ticket) REFERENCES "Step04A".Sales (id);

ALTER TABLE "Step04A".Sales
    ADD CONSTRAINT FK1_Sales FOREIGN KEY (Customer) REFERENCES "Step04A".Consumers (id);

ALTER TABLE "Step04A".Sales
    ADD CONSTRAINT FK2_Sales FOREIGN KEY (Person) REFERENCES "Step04A".Persons (id);

--ALTER TABLE "Step04A".Sales
--    ADD CONSTRAINT FK3_Sales FOREIGN KEY  (id) REFERENCES "Step04A".Receipts (id);