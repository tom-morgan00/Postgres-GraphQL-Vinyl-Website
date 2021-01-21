import React from 'react';
import classes from '../styles/components/Others.module.css';

export default function Filters({ setSelectOptions, selected }) {
  const options = [
    { value: 'Filters' },
    { column: 'artist', order: 'ASC', value: 'Artist: A-Z' },
    { column: 'artist', order: 'DESC', value: 'Artist: Z-A' },
    { column: 'title', order: 'ASC', value: 'Title: A-Z' },
    { column: 'title', order: 'DESC', value: 'Title: Z-A' },
    { column: 'price', order: 'ASC', value: 'Price: Lowest' },
    { column: 'price', order: 'DESC', value: 'Price: Highest' },
    { column: 'release_date', order: 'ASC', value: 'Oldest' },
    { column: 'release_date', order: 'DESC', value: 'Newest' },
  ];

  return (
    <div className={classes.filters}>
      <span>
        Sorted by <strong>{options[selected].value}</strong>{' '}
      </span>
      <select
        value={''}
        onChange={(e) => {
          setSelectOptions(
            options[e.target.value].column,
            options[e.target.value].order,
            e.target.value
          );
        }}
      >
        {options.map((opt, index) => (
          <option value={index}>{opt.value}</option>
        ))}
      </select>
    </div>
  );
}
