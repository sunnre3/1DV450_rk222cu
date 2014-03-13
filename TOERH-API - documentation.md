THE OPEN EDUCATION RESOURCE HANDLER
===================================
### TOC
1. Read first
2. Resources
    - Retrieve all resources
    - Retrieve one resource
    - Add a resource
    - Update a resource
    - Delete a resource
    - Retrieve all tags for one resource
3. Users
    - Retrieve all users
    - Retrieve one user
    - Retrieve all resources for one user
4. Tags
    - Retrieve all tags
    - Retrieve one tag
    - Add a tag
    - Delete a tag
    - Retrieve all resources for one tag
5. Types of resources
    - Retrieve all types of resources
    - Retrieve one type of resources
6. Licences
    - Retrieve all types of licences
    - Retrieve one type of licence

# 1. Read first
<br>
FIrst off, this API is still in development so don't worry if you come across any kind of bug. They will get sorted out eventually. If you want to help you can email the sys admin at *admin@toerh.com* with any kind of feedback or bug reports you might have.

Second, as of right now the API is locked down entirely and every requests requires an API key. To get one, go to *http://dev.toerh.com/* and sign up as a developer.

As a way to keep safe we also require that on *un-safe* requests (such as creating or deleting a resource) that you supply us with __both__ email and password for the user that owns the resource (or is creating it).

To supply us with these two messures of security you add these to the header of your request. The header name for the API-key is simply Token and the email and password is a standard HTTP Basic Authorization. Google how to use it if you don't know already.

Please also note that while all example responses below are in JSON we do also deliver our data in XML. If you want your data as XML be sure to specify this by either setting a GET parameter (?format=xml) or by adding the .xml file extension to your request.

# 2. Resources
## 2.1 Retrieve all resources
**Method:** GET  
**URL:** /api/v1/resources  
**Required parameters:**
1. none

<br>
**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
            "self": http://webapi.url/api/v1/resources",
            "items": [
                {
                    "href": "http.//webapi.url/api/v1/resources/2"
                    "data": {
                        "name": "Gurka sjunger en sång"
                        "description": "Grodan Gurka sjunger en fin sång för oss alla."
                        "resourceType": "Audio"
                        "url": "http://dummy.url/gurkan_sjunger.wav"
                        "licence": "CC"
                    },
                    "links": {
                        "user": "http://webapi.url/api/v1/users/13"
                        "tags": "http://webapi.url/api/v1/resources/2/tags"
                        "resourceType: "http://webapi.url/api/v1/resource_types/1"
                        "licence": "http://webapi.url/api/v1/licences/1"
                    }
                }
                ...
                ...
            ],
            "pagination": {
                "totalResources": 1242,
                "totalPages": 25,
                "currentPage": 3,
                "perPage": 50,
                "links": {
                    "previous": "http://webapi.url/api/v1/resources?page=2"
                    "next": "http://webapi.url/api/v1/resources?page=4"
                }
            }
        }
    }
````

## 2.2 Retrieve one resource
**Method:** GET  
**URL:** /api/v1/resources/{resource_id}  
**Required parameters:**
1. resource_id

**Expected response:**  
**Status code:** <font color="#0F0">200 OK</font>

````javascript
    {
        "instance":
            "self": http://webapi.url/api/v1/resources",
            "data": {    
                "name": "Gurka sjunger en sång"
                "description": "Grodan Gurka sjunger en fin sång för oss alla."
                "resourceType": "Audio"
                "url": "http://dummy.url/gurkan_sjunger.wav"
                "licence": "CC"
            },
            "links": {
                "user": "http://webapi.url/api/v1/users/13"
                "tags": "http://webapi.url/api/v1/resources/2/tags"
                "resourceType: "http://webapi.url/api/v1/resource_types/1"
                "licence": "http://webapi.url/api/v1/licences/1"
            }
        }
    }
````

## 2.3 Add a resource
**Method:** POST  
**URL:** /api/v1/resources/{resource_id}  
**Required parameters:**
1. resource_id
2. resource_type_id <font color="#f00">*</font>
3. user_id <font color="#f00">*</font>
4. licence_id <font color="#f00">*</font>
5. name<font color="#f00">*</font>
6. description <font color="#f00">*</font>
7. url <font color="#f00">*</font>

<font color="#f00">_*_</font> * means the parameter has to be prepended by [resource].
eg. [resource]user_id*  

Please take note that in the event you or the user fails to provide any of these you will get either a *401 Unauthorized* or a *400 Bad Request* along with a message on what went wrong. If the status is *400* we even provide you with some validation error messages that you can pass along to your user so that he/she can correct their errors.  

**Expected response:**  
**Status code:** <font color="#0F0">201 Created</font>

````javascript
    {
        "instance":
            "self": http://webapi.url/api/v1/resources",
            "data": {    
                "name": "Intervjuinspelning"
                "description": "Inspelning från vår intervju med herr Boll."
                "resourceType": "Video"
                "url": "http://dummy.url/herr_boll.wmv"
                "licence": "CC"
            },
            "links": {
                "user": "http://webapi.url/api/v1/users/13"
                "tags": "http://webapi.url/api/v1/resources/2/tags"
                "resourceType: "http://webapi.url/api/v1/resource_types/2"
                "licence": "http://webapi.url/api/v1/licences/1"
            }
        }
    }
````

## 2.4 Update a resource
**Method:** PUT/PATCH  
**URL:** /api/v1/resources/{resource_id}  
**Required parameters:**
1. resource_id
2. resource_type_id <font color="#f00">*</font>
3. user_id <font color="#f00">*</font>
4. licence_id <font color="#f00">*</font>
5. name<font color="#f00">*</font>
6. description <font color="#f00">*</font>
7. url <font color="#f00">*</font>

Please take note that in the event you or the user fails to provide any of these you will get either a *401 Unauthorized* or a *400 Bad Request* along with a message on what went wrong. If the status is *400* we even provide you with some validation error messages that you can pass along to your user so that he/she can correct their errors.  

**Expected response:**  
**Status code:** <font color="#0F0">200 OK</font>

````javascript
    {
        "instance":
            "self": http://webapi.url/api/v1/resources",
            "data": {    
                "name": "Intervjuinspelning - revision 2"
                "description": "Inspelning från vår intervju med herr Boll. EDIT: rätt fil."
                "resourceType": "Video"
                "url": "http://dummy.url/herr_boll_final.wmv"
                "licence": "CC"
            },
            "links": {
                "user": "http://webapi.url/api/v1/users/13"
                "tags": "http://webapi.url/api/v1/resources/2/tags"
                "resourceType: "http://webapi.url/api/v1/resource_types/2"
                "licence": "http://webapi.url/api/v1/licences/1"
            }
        }
    }
````

### 2.5 Delete a resource
**Method:** DELETE  
**URL:** /api/v1/resources/{resource_id}  
**Required parameters:**
1. resource_id

**Expected response:**  
**Status code:** <font color="#0F0">200 OK</font>

````javascript
    {
        "status": 200,
        "message": "The resource was successfully deleted.",
        "developerMessage": "The resource with an id of '{resource_id}' was deleted.'
    }
````

### 2.6 Retrieve all tags for one resource
**Method:** GET  
**URL:** /api/v1/resources/{resource_id}/tags  
**Required parameters:**
1. resource_id

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
            "self": http://webapi.url/api/v1/resources/{resource_id}/tags",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/tags/8",
                    "data": {
                        "tag": "tacos",
                        "createdAt": "2014-03-12T00:22:57.935Z"
                    },
                    "links": {
                        "resources": "http://localhost:3000/api/v1/tags/8/resources"
                    }
                }
                ...
                ...
            ],
            "pagination": {
                "totalTags": 9,
                "totalPages": 3,
                "currentPage": 2,
                "perPage": 3,
                "links": {
                    "previous": "http://webapi.url/api/v1/resources/{resource_id}/tags?page=1"
                    "next": "http://webapi.url/api/v1/resources/{resource_id}/tags?page=3"
                }
            }
        }
    }
````

# Users
## 3.1 Retrieve all users
**Method:** GET  
**URL:** /api/v1/users  
**Required parameters:**
1. none

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
            "self": "http://localhost:3000/api/v1/users",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/users/1",
                    "data": {
                        "firstname": "John",
                        "surname": "Doe",
                        "email": "john.doe@email.com",
                        "resourcesCount": 4
                    },
                    "links": {
                        "resources": "http://localhost:3000/api/v1/users/1/resources"
                    }
                }
                ...
                ...
            ],
            "pagination": {
                "totalUsers": 524,
                "totalPages": 11,
                "currentPage": 3,
                "perPage": 50,
                "links": {
                    "previous": "http://webapi.url/api/v1/users?page=2"
                    "next": "http://webapi.url/api/v1/users?page=4"
                }
            }
        }
    }
````

## 3.2 Retrieve one user
**Method:** GET  
**URL:** /api/v1/users/{user_id}  
**Required parameters:**
1. user_id

**Expected response:**  
**Status code:** <font color="#0F0">200 OK</font>

````javascript
    {
        "instance":
                "self": "http://localhost:3000/api/v1/users/2",
                "data": {
                    "firstname": "Rickard",
                    "surname": "Karlsson",
                    "email": "sunnre3@gmail.com",
                    "resourcesCount": 11,
                    "createdAt": "2014-03-09T21:04:34.920Z"
                },
                "links": {
                    "resources": "http://localhost:3000/api/v1/users/2/resources"
                }
            }
        }
    }
````

### 3.3 Retrieve all resources for one user
**Method:** GET  
**URL:** /api/v1/users/{user_id}/resources  
**Required parameters:**
1. user_id

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
            "self": http://webapi.url/api/v1/resources/{resource_id}/tags",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/tags/8",
                    "data": {
                        "tag": "tacos",
                        "createdAt": "2014-03-12T00:22:57.935Z"
                    },
                    "links": {
                        "resources": "http://localhost:3000/api/v1/tags/8/resources"
                    }
                }
                ...
                ...
            ],
            "pagination": {
                "totalTags": 9,
                "totalPages": 3,
                "currentPage": 2,
                "perPage": 3,
                "links": {
                    "previous": "http://webapi.url/api/v1/resources/{resource_id}/tags?page=1"
                    "next": "http://webapi.url/api/v1/resources/{resource_id}/tags?page=3"
                }
            }
        }
    }
````

# 4. Tags
## 4.1 Retrieve all tags
**Method:** GET  
**URL:** /api/v1/tags  
**Required parameters:**
1. none

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
           "self": "http://localhost:3000/api/v1/tags",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/tags/1",
                    "data": {
                        "tag": "sol",
                        "createdAt": "2014-02-24T05:41:40.618Z"
                    },
                    "links": {
                        "resources": "http://localhost:3000/api/v1/tags/1/resources"
                    }
                }
                ...
                ...
            ],
            "pagination": {
                "totalTags": 2020,
                "totalPages": 41,
                "currentPage": 3,
                "perPage": 50,
                "links": {
                    "previous": "http://webapi.url/api/v1/tags?page=2"
                    "next": "http://webapi.url/api/v1/tags?page=4"
                }
            }
        }
    }
````

## 4.2 Retrieve one tag
**Method:** GET  
**URL:** /api/v1/tags/{tag_id}  
**Required parameters:**
1. tag_id

**Expected response:**  
**Status code:** <font color="#0F0">200 OK</font>

````javascript
    {
        "instance":
            "self": "http://localhost:3000/api/v1/tags/5",
            "data": {
                "tag": "rolig",
                "createdAt": "2014-03-10T19:26:25.459Z"
            },
            "links": {
                "resources": "http://localhost:3000/api/v1/tags/5/resources"
            }
        }
    }
````

## 4.3 Add a tag
**Method:** POST  
**URL:** /api/v1/resources/{resource_id}/tags  
**Required parameters:**
1. resource_id
2. tag

Please take note that in the event you or the user fails to provide any of these you will get either a *401 Unauthorized* or a *400 Bad Request* along with a message on what went wrong. If the status is *400* we even provide you with some validation error messages that you can pass along to your user so that he/she can correct their errors.  

**Expected response:**  
**Status code:** <font color="#0F0">201 Created</font>

````javascript
    {
        "instance": {
            "self": "http://localhost:3000/api/v1/tags/5",
            "data": {
                "tag": "rolig",
                "createdAt": "2014-03-10T19:26:25.459Z"
            },
            "links": {
                "resources": "http://localhost:3000/api/v1/tags/5/resources"
            }
        }
    }
````

### 4.4 Delete a tag
**Method:** DELETE  
**URL:** /api/v1/resources/{resource_id}/tags/{tag_id}  
**Required parameters:**
1. resource_id
2. tag_id

**Expected response:**  
**Status code:** <font color="#0F0">200 OK</font>

````javascript
    {
        "status": 200,
        "message": "The tag was successfully deleted.",
        "developerMessage": "The tag with an id of '{resource_id}' was deleted.'
    }
````

### 4.5 Retrieve all resources for one tag
**Method:** GET  
**URL:** /api/v1/tags/{tag_id}/resources  
**Required parameters:**
1. tag_id

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
            "self": "http://localhost:3000/api/v1/tags/3/resources",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/resources/3",
                    "data": {
                        "name": "Ljudresurs",
                        "description": "En asbra beskrivning!",
                        "resourceType": "Video",
                        "url": "http://shiturl.se/",
                        "user": "john.doe@email.com",
                        "licence": "GNU"
                    },
                    "links": {
                        "user": "http://localhost:3000/api/v1/users/1",
                        "tags": "http://localhost:3000/api/v1/resources/3/tags",
                        "resourceType": "http://localhost:3000/api/v1/resource_types/2",
                        "licence": "http://localhost:3000/api/v1/licences/3"
                    }
                }
                ...
                ...
            ],
            "pagination": {
                "totalTags": 9,
                "totalPages": 3,
                "currentPage": 2,
                "perPage": 3,
                "links": {
                    "previous": "http://localhost:3000/api/v1/tags/3/resources?page=1"
                    "next": "http://localhost:3000/api/v1/tags/3/resources?page=3"
                }
            }
        }
    }
````

# Types of resources
## 5.1 Retrieve all types of resources
**Method:** GET  
**URL:** /api/v1/resource_types  
**Required parameters:**
1. none

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
    "collection":
            "self": "http://localhost:3000/api/v1/resource_types",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/resource_types/1",
                    "data": {
                        "type": "Image",
                        "resourceCount": 2,
                        "createdAt": "2014-02-24T05:41:40.567Z"
                    },
                    "links": {
                        "resources": "http://localhost:3000/api/v1/resource_types/1/resources"
                    }
                }
                ...
                ...
            ]
        }
    }
````

## 5.2 Retrieve one type of resource
**Method:** GET  
**URL:** /api/v1/resource_types/{resource_type_id}  
**Required parameters:**
1. resource_type_id

**Expected response:**  
**Status code:** <font color="#0F0">200 OK</font>

````javascript
    {
       "instance": {
            "self": "http://localhost:3000/api/v1/resource_types/1",
            "data": {
                "type": "Image",
                "resourceCount": 2,
                "createdAt": "2014-02-24T05:41:40.567Z"
            },
            "links": {
                "resources": "http://localhost:3000/api/v1/resource_types/1/resources"
            }
        }
    }
````

### 5.3 Retrieve all resources for one resource type
**Method:** GET  
**URL:** /api/v1/resource_types/{resource_type_id}/resources  
**Required parameters:**
1. resource_type_id

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
            "self": "http://localhost:3000/api/v1/resource_types/1/resources",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/resources/5",
                    "data": {
                        "name": "En resurs",
                        "description": "En testresurs",
                        "resourceType": "Image",
                        "url": "http://resurs.se/",
                        "user": "sunnre3@gmail.com",
                        "licence": "MIT"
                    },
                    "links": {
                        "user": "http://localhost:3000/api/v1/users/2",
                        "tags": "http://localhost:3000/api/v1/resources/5/tags",
                        "resourceType": "http://localhost:3000/api/v1/resource_types/1",
                        "licence": "http://localhost:3000/api/v1/licences/1"
                    }
                }
                ...
                ...
            ],
            "pagination": {
                "totalTags": 9,
                "totalPages": 3,
                "currentPage": 2,
                "perPage": 3,
                "links": {
                    "previous": "http://localhost:3000/api/v1/resource_types/1/resources?page=1"
                    "next": "http://localhost:3000/api/v1/resource_types/1/resources?page=3"
                }
            }
        }
    }
````

# Licences
## 6.1 Retrieve all licences
**Method:** GET  
**URL:** /api/v1/licences  
**Required parameters:**
1. none

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
            "self": "http://localhost:3000/api/v1/licences",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/licences/1",
                    "data": {
                        "licence_type": "MIT",
                        "created_at": "2014-02-24T05:41:40.550Z"
                    },
                    "links": "http://localhost:3000/api/v1/licences/1/resources"
                }
                ...
                ...
            ]
        }
    }
````

## 3.2 Retrieve one type of licence
**Method:** GET  
**URL:** /api/v1/licences/{licence_id}  
**Required parameters:**
1. licence_id

**Expected response:**  
**Status code:** <font color="#0F0">200 OK</font>

````javascript
    {
       "instance": {
            "self": "http://localhost:3000/api/v1/licences/1",
            "data": {
                "licence_type": "MIT",
                "created_at": "2014-02-24T05:41:40.550Z"
            },
            "links": "http://localhost:3000/api/v1/licences/1/resources"
        }
    }
````

### 3.3 Retrieve all resources for one licence
**Method:** GET  
**URL:** /api/v1/licences/{licence_id}/resources  
**Required parameters:**
1. licence_id

**Expected response:**  
**Status code**: <font color="#0F0">200 OK</font>

````javascript
    {
        "collection":
            "self": "http://localhost:3000/api/v1/resource_types/1/resources",
            "items": [
                {
                    "href": "http://localhost:3000/api/v1/resources/5",
                    "data": {
                        "name": "En resurs",
                        "description": "En testresurs",
                        "resourceType": "Image",
                        "url": "http://resurs.se/",
                        "user": "sunnre3@gmail.com",
                        "licence": "MIT"
                    },
                    "links": {
                        "user": "http://localhost:3000/api/v1/users/2",
                        "tags": "http://localhost:3000/api/v1/resources/5/tags",
                        "resourceType": "http://localhost:3000/api/v1/resource_types/1",
                        "licence": "http://localhost:3000/api/v1/licences/1"
                    }
                }
                ...
                ...
            ],
            "pagination": {
                "totalTags": 9,
                "totalPages": 3,
                "currentPage": 2,
                "perPage": 3,
                "links": {
                    "previous": "http://localhost:3000/api/v1/resource_types/1/resources?page=1"
                    "next": "http://localhost:3000/api/v1/resource_types/1/resources?page=3"
                }
            }
        }
    }
````