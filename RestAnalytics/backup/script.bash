cd backup

# 1. Dump Data and Structure (Respaldar Datos y Estructura):
mysqldump -u root -p RestAnalytics > backup_data_and_structure.sql

# 2. Dump Data Only (Respaldar solo Datos):
mysqldump -u root -p --no-create-info RestAnalytics > backup.sql

# 3. Dump Structure Only (Respaldar solo Estructura):
mysqldump -u root -p --no-data RestAnalytics > backup_structure_only.sql
