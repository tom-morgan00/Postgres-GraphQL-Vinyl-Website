import React from 'react';
import classes from '../../styles/Product.module.css';
import { GET_PRODUCTS } from '../../graphql/queries/getProducts.graphql';
import { useQuery } from '@apollo/client';

export default function Products() {
  const { loading, error, data } = useQuery(GET_PRODUCTS);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>{error.message}</div>;

  return (
    <section>
      <h1 className={classes.title}>Products</h1>
      <section className={classes.products}>
        {data &&
          data.getProducts.map((prod) => {
            return (
              <div className={classes.product} key={prod.id}>
                <div className={classes.productImage}>
                  <img src={prod.image} alt={prod.title} />
                </div>
                <h4>{prod.title}</h4>
                <p>{prod.artist}</p>
                <p>£{prod.price}</p>
              </div>
            );
          })}
      </section>
    </section>
  );
}
