import React from 'react';
import classes from '../styles/Components.module.css';

export default function PaginationButtons({ index, setIndex, maxPages }) {
  const page = index + 1;

  const onPageButtonClick = (e) => {
    if (e.target.value === 'next') {
      //set page to next
      setIndex(index + 1);
      window.scrollTo(0, 0);
      //set start/ end
    } else {
      //set page to prev
      setIndex(index - 1);
      window.scrollTo(0, 0);
      //set start/end
    }
  };

  return (
    <section className={classes.pagination}>
      {page === 1 ? (
        <>
          <span className={classes.pageNumber}>{`${page} of ${maxPages}`}</span>
          <div className={`${classes.pageButton} ${classes.next}`}>
            <button onClick={(e) => onPageButtonClick(e)} value="next">
              Next
            </button>
          </div>
        </>
      ) : page > 1 && page < maxPages ? (
        <>
          <div className={`${classes.pageButton} ${classes.prev}`}>
            <button onClick={(e) => onPageButtonClick(e)} value="prev">
              Prev
            </button>
          </div>
          <span className={classes.pageNumber}>{`${page} of ${maxPages}`}</span>
          <div className={`${classes.pageButton} ${classes.next}`}>
            <button onClick={(e) => onPageButtonClick(e)} value="next">
              Next
            </button>
          </div>
        </>
      ) : (
        <>
          <div className={`${classes.pageButton} ${classes.prev}`}>
            <button onClick={(e) => onPageButtonClick(e)} value="prev">
              Prev
            </button>
          </div>
          <span className={classes.pageNumber}>{`${page} of ${maxPages}`}</span>
        </>
      )}
    </section>
  );
}
