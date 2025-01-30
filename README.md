# Hosts lombok.jar locally

## Setup
1. Disable certificate verification for wget:  
   ```
   echo "check_certificate=off" >> ~/.wgetrc
   ```

2. Add hosts entry:  
   ```
   echo "127.0.0.1  projectlombok.org"
   ```

3. Start the server:  
   ```
   ./run.sh
   ```

4. Run:  
   ```
   wget https://projectlombok.org/downloads/lombok.jar
   ```
