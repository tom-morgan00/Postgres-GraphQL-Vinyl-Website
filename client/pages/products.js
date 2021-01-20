import React, { useState } from 'react';
import { useQuery } from '@apollo/client';
import { GET_PRODUCTS_ORDER_BY } from '../graphql/queries/getProducts.graphql';
import classes from '../styles/Product.module.css';
import Layout from '../components/Layout';
import Filters from '../components/Filters';
import NextLink from 'next/link';
import PaginationButtons from '../components/PaginationButtons';

export default function albums() {
  const [selected, setSelected] = useState(1);
  const [column, setColumn] = useState('artist');
  const [order, setOrder] = useState('');
  const limit = 24;
  const [index, setIndex] = useState(0);

  console.log(limit);
  const { loading, error, data } = useQuery(GET_PRODUCTS_ORDER_BY, {
    skip: column === undefined,
    variables: { column, order },
  });

  const setSelectOptions = (col, order, index) => {
    setColumn(col);
    setOrder(order);
    setSelected(index);
    setIndex(0);
  };

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
            <Filters setSelectOptions={setSelectOptions} selected={selected} />
          </div>
          <section className={classes.products}>
            {data &&
              data.getProductsOrderBy
                .map((prod) => {
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
                })
                .slice(index * limit, (index + 1) * limit)}
          </section>
          <PaginationButtons
            index={index}
            setIndex={setIndex}
            maxPages={Math.ceil(data.getProductsOrderBy.length / limit)}
          />
        </main>
      </Layout>
    </div>
  );
}
