# The name of this view in Looker is "Order Payments"
view: order_payments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ae-capstone-raw.ecommerce.order_payments`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Order ID" in Explore.

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: payment_installments {
    type: number
    sql: ${TABLE}.payment_installments ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_payment_installments {
    type: sum
    sql: ${payment_installments} ;;
  }

  measure: average_payment_installments {
    type: average
    sql: ${payment_installments} ;;
  }

  dimension: payment_sequential {
    type: number
    sql: ${TABLE}.payment_sequential ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: payment_value {
    type: number
    sql: ${TABLE}.payment_value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
