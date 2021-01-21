import React from 'react';
import classes from '../../styles/components/Products.module.css';
import NextLink from 'next/link';

export default function Products({ products }) {
  return products ? (
    <section className={classes.products}>
      {products.map((prod) => {
        return (
          <div className={classes.product} key={prod.id}>
            <div className={classes.productImage}>
              <NextLink href={`/products/${prod.id}`}>
                <img src={prod.image} alt={prod.title} />
              </NextLink>
            </div>
            <h4>{prod.title}</h4>
            {prod.artist ? <p>{prod.artist}</p> : null}
            <p>£{prod.price}</p>
          </div>
        );
      })}
    </section>
  ) : null;
}
