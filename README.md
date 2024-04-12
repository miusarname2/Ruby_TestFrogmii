# Technical Challenge - Seismic Data Application
## Objectives
- Develop an application in Ruby or a Ruby-based framework that includes a Task for obtaining and persisting seismic data and an API exposing two endpoints for external client consumption.
- Develop a simple HTML5 and JavaScript webpage to query the API endpoints. Bonus points for using EmberJS, React, AngularJS, or VueJS frameworks.

## Backend Development
### 1. Obtaining and Persisting Data
Develop a Task to obtain seismic data from the USGS site (earthquake.usgs.gov) in GeoJSON format. Persist the following data in the database:
- `id`
- `properties.mag`
- `properties.place`
- `properties.time`
- `properties.url`
- `properties.tsunami`
- `properties.magType`
- `properties.title`
- `geometry.coordinates[0]` (longitude)
- `geometry.coordinates[1]` (latitude)

Ensure data validation and uniqueness when running the Task.

### 2. REST API Endpoints
Develop two endpoints:
#### 2.1 GET List of Features
- Expose data in the specified format.
- Allow filtering by `mag_type`, `page`, and `per_page` parameters.

#### 2.2 POST Create a Comment
- Create a comment related to a feature based on the payload.
- Validate the payload and persist each comment.

## API Usage
To access the API endpoints:
- GET features: `http://localhost:3000/earthquakes.json`
- POST comments: `http://127.0.0.1:3000/comments.json`
  - Body JSON format: 
    ```json
    {
      "body": "This is a comment",
      "feature_id": 2
    }
    ```

## Frontend Access
- Homepage: `http://localhost:3000/` or `/`
- Create a Comment: `http://localhost:3000/comments/new` or `/comments/new`
- Filter Features: `http://localhost:3000/earthquakes/1` or `/earthquakes/1`

The frontend for this application was developed in React and is located in the "earthquake-front" branch.

