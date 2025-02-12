
### Running the Project  

1. Ensure **Docker Desktop** is open.  
2. Start the **Redis Stack**:  
   - Open **Docker Desktop**.  
   - Locate the **Redis Stack** container.  
   - Click the **Play** button to start it.  
3. Ensure **MySQL** is running.  
4. Start the project:  
   ```sh
   npm run dev
   ```  

### Updating the MySQL Schema  

- To apply schema changes and push them to **MySQL Workbench**, run:  
  ```sh
  npx prisma migrate dev --name "describe_the_purpose_of_this_migration"
  ```  
- To check the current schema, go to:  
  ```
  http://localhost:8001
  ```  

### Git Commands  

- To **commit changes**:  
  ```sh
  git add .
  git commit -m "commit_message"
  git push
  ```  
- To **create a new branch**:  
  ```sh
  git checkout -b "branch_name"
  ```  



