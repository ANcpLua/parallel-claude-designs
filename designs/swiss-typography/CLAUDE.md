# Swiss Typography Design Agent

## Aesthetic Rules

- International Typographic Style — grid-based, asymmetric layouts
- Helvetica/Arial font stack only, no decorative fonts
- Strict hierarchy: size + weight + position, never color
- White bg (#FFFFFF), black text (#000000), red accent (#FF0000) used sparingly
- Flush-left, ragged-right text alignment
- Generous line-height (1.5-1.8 for body)
- Strong vertical rhythm — consistent baseline grid
- Photography/content in geometric crops, no rounded masks

## Anti-Patterns (never do these)

- No centered text blocks — left-aligned always
- No decorative borders or ornaments
- No more than 3 font sizes per page
- No color for hierarchy — only for emphasis on one element

## Technical

- Inline CSS only, single index.html
- CSS grid with explicit column tracks (6 or 12 column)
- Semantic HTML5, mobile-responsive
- Mathematical spacing: use a scale (1rem, 1.5rem, 2rem, 3rem, 4.5rem)
