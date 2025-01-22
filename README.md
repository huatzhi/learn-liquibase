# Database Migration Project

This repository contains database migration scripts managed with Liquibase for multi-schema database setup.

## Project Structure

```
📁 liquibase/
├── 📁 changelog/
│   ├── 📁 schema1/
│   │   ├── 20240101000000000-create-tables.yml
│   │   ├── 20240102000000000-add-indexes.yml
│   │   └── 20240105000000000-alter-user-and-create-views.yml
│   ├── 📁 schema2/
│   │   ├── 20240103000000000-init-schema.yml
│   │   └── 20240104000000000-add-order-items.yml
│   └── master.yml
└── 📁 sql/
    └── 📁 schema-setup/
        └── setup-20250121090441.sql
```

## Prerequisites

- Java 11 or higher
- Liquibase CLI
- PostgreSQL database

## Setup

1. Clone the repository:
   ```bash
   git clone [repository-url]
   cd [project-directory]
   ```

2. Configure database connection:
   - Copy `liquibase.properties.example` to `liquibase.properties`
   - Update the database connection details:
     ```properties
     url=jdbc:postgresql://localhost:5432/your_database
     username=your_username
     password=your_password
     ```

## Usage

### Running Migrations

To apply all pending changes:
```bash
liquibase update
```

To check status of migrations:
```bash
liquibase status
```

To rollback to a specific tag:
```bash
liquibase rollback your_tag
```

### Creating New Migrations

1. Create a new changelog file in the appropriate schema directory
2. Name format: `YYYYMMDD000000000-description.yml`
3. Include the changelog in the schema's master changelog

Example changelog:
```yaml
databaseChangeLog:
  - property:
      name: schema
      value: schema1
  
  - changeSet:
      id: YYYYMMDDNN-description
      author: your_name
      changes:
        - createTable:
            tableName: example
            schemaName: ${schema}
            columns:
              - column:
                  name: id
                  type: bigint
                  autoIncrement: true
                  constraints:
                    primaryKey: true
                    nullable: false
```

## Schema Management

This project manages multiple schemas:

- `schema1`: Core business entities
- `schema2`: Order management system

Each schema has its own directory for changelogs, ensuring clear separation of concerns.

## Best Practices

1. Always include descriptive comments in changesets
2. Use meaningful changeset IDs (timestamp + description)
3. Include rollback instructions where possible
4. Test changes in development before applying to production
5. Maintain backward compatibility
6. Use schema properties consistently

## Common Commands

Check status:
```bash
liquibase status
```

Generate SQL without applying:
```bash
liquibase updateSQL
```

Rollback last change:
```bash
liquibase rollbackCount 1
```

Tag current state:
```bash
liquibase tag version_1.0
```

## Troubleshooting

### Common Issues

1. **Lock Table Issues**
   ```bash
   liquibase releaseLocks
   ```

2. **Validation Errors**
   - Check changeset IDs are unique
   - Verify changelog file is properly formatted
   - Ensure all referenced schemas exist

3. **Connection Issues**
   - Verify database credentials
   - Check database server is accessible
   - Confirm proper network connectivity

## Contributing

1. Create feature branch from main
2. Follow naming conventions
3. Test changes thoroughly
4. Submit pull request with clear description

## Maintenance

- Regularly clean up unused changesets
- Keep documentation updated
- Monitor changelog size and performance
- Regular validation of rollback scripts``