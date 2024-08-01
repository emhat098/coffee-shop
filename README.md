# coffee-shop
The full stack of coffee shop

# The main format of json is should be:

```json
{
    "id": "<uuid>",
    "title": "String",
    "price": "Number",
    "images": "[]{
        src: String,
        alt: String,
    }", // It is should be json type -> Postgresql is supporting this type.
    "content": "String",
    "salePrice": "Number",
    "description": "Number",
    "seoURL": "String",
    "seoDesc": "String",
    "createdAt": "Date", // Get current time.
    "updatedAt": "Date",
    "isHidden": "Boolean", // hide product from user.
}
```

RESTFUL API works on this format json.

## Technical stack

- Laravel + Postgres 16 + Flutter + Google Firebase Storage.

Good luck to us `;)`.