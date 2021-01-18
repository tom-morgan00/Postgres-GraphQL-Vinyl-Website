import React, { useState } from 'react';
import { useQuery } from '@apollo/client';
import { GET_PRODUCTS_ORDER_BY } from '../graphql/queries/getProducts.graphql';
import classes from '../styles/Product.module.css';
import Layout from '../components/Layout';
import Filters from '../components/Filters';
import NextLink from 'next/link';

export default function albums() {
  const [column, setColumn] = useState('artist');
  const [order, setOrder] = useState('');
  const { loading, error, data } = useQuery(GET_PRODUCTS_ORDER_BY, {
    skip: column === undefined,
    variables: { column, order },
  });
  console.log(data);

  if (loading) {
    return <div>Loading...</div>;
  }
  if (error) {
    return <div>{error.message}</div>;
  }

  return (
    <div className={classes.app}>
      <Layout>
        <main className={classes.main}>
          <div className={classes.banner}>
            <h1 className={classes.title}>Products</h1>
            <Filters setColumn={setColumn} setOrder={setOrder} />
          </div>
          <section className={classes.products}>
            {data &&
              data.getProductsOrderBy.map((prod) => {
                return (
                  <div className={classes.product} key={prod.id}>
                    <div className={classes.productImage}>
                      <NextLink href={`/products/${prod.id}`}>
                        <img src={prod.image} alt={prod.title} />
                      </NextLink>
                    </div>
                    <h4>{prod.title}</h4>
                    <p>{prod.artist}</p>
                    <p>£{prod.price}</p>
                  </div>
                );
              })}
          </section>
        </main>
      </Layout>
    </div>
  );
}
