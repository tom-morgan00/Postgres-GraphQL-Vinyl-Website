import { useQuery } from '@apollo/client';
import { useRouter } from 'next/router';
import React from 'react';
import { GET_PRODUCT_BY_ID } from '../../graphql/queries/getProducts.graphql';
import classes from '../../styles/components/Others.module.css';
import Products from '../../components/Products/Products';
import Layout from '../../components/Layout';
import ProductDetails from '../../components/Products/ProductDetails';

export default function product() {
  const router = useRouter();
  const id = router.query.id;
  const { loading, error, data } = useQuery(GET_PRODUCT_BY_ID, {
    variables: { id },
    skip: id === undefined,
  });
  console.log(id);
  console.log(data);

  if (loading) {
    return <div>Loading...</div>;
  }
  if (error) {
    return <div>{error.message}</div>;
  }

  if (data && data.getProductByID) {
    // prettier-ignore
    const { relatedAlbums } = data.getProductByID;

    return (
      <Layout>
        <main className={classes.main}>
          <ProductDetails product={data.getProductByID.product} />
          <section className={classes.related}>
            <h2 className={classes.title}>Related Products</h2>
            <Products products={relatedAlbums} />
          </section>
        </main>
      </Layout>
    );
  }

  return null;
}
