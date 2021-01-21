import React from 'react';
import classes from '../../styles/pages/ProductDetails.module.css';

export default function ProductDetails({ product }) {
  return product ? (
    <section className={classes.productDetails}>
      <section className={classes.productTop}>
        <div className={classes.image}>
          <img src={product.image} alt={product.title} />
        </div>
        <div className={classes.productInfo}>
          <h3>{product.title}</h3>
          <h4>{product.artist}</h4>
          <p>£{product.price}</p>
          <p>{product.label}</p>
          <div className={classes.button}>
            <button>Add to Cart</button>
          </div>
        </div>
      </section>
      <section className={classes.productBottom}>
        <div>
          <h4>Tracks</h4>
          <ul className={classes.tracks}>
            {product.tracklist.map((track, index) => (
              <li key={index}>{`${index + 1}: ${track}`}</li>
            ))}
          </ul>
        </div>
      </section>
    </section>
  ) : null;
}
