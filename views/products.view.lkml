# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ae-capstone-raw.ecommerce.products`
    ;;
  drill_fields: [product_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Product Category Name" in Explore.

  dimension: product_category_name {
    type: string
    sql: ${TABLE}.product_category_name ;;
  }

  dimension: product_description_lenght {
    type: number
    sql: ${TABLE}.product_description_lenght ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_product_description_lenght {
    type: sum
    sql: ${product_description_lenght} ;;
  }

  measure: average_product_description_lenght {
    type: average
    sql: ${product_description_lenght} ;;
  }

  dimension: product_height_cm {
    type: number
    sql: ${TABLE}.product_height_cm ;;
  }

  dimension: product_length_cm {
    type: number
    sql: ${TABLE}.product_length_cm ;;
  }

  dimension: product_name_lenght {
    type: number
    sql: ${TABLE}.product_name_lenght ;;
  }

  dimension: product_photos_qty {
    type: number
    sql: ${TABLE}.product_photos_qty ;;
  }

  dimension: product_weight_g {
    type: number
    sql: ${TABLE}.product_weight_g ;;
  }

  dimension: product_width_cm {
    type: number
    sql: ${TABLE}.product_width_cm ;;
  }

  measure: count {
    type: count
    drill_fields: [product_id, product_category_name]
  }
}
