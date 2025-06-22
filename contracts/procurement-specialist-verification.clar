;; Procurement Specialist Verification Contract
;; Validates and manages procurement specialists

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_CREDENTIALS (err u103))

;; Data structures
(define-map specialists
  { specialist: principal }
  {
    verified: bool,
    certification-level: uint,
    reputation-score: uint,
    verification-date: uint,
    specialization: (string-ascii 50)
  }
)

(define-map verification-requests
  { request-id: uint }
  {
    specialist: principal,
    credentials: (string-ascii 200),
    status: (string-ascii 20),
    submitted-at: uint
  }
)

(define-data-var next-request-id uint u1)

;; Public functions
(define-public (submit-verification-request (credentials (string-ascii 200)) (specialization (string-ascii 50)))
  (let ((request-id (var-get next-request-id)))
    (map-set verification-requests
      { request-id: request-id }
      {
        specialist: tx-sender,
        credentials: credentials,
        status: "pending",
        submitted-at: block-height
      }
    )
    (var-set next-request-id (+ request-id u1))
    (ok request-id)
  )
)

(define-public (verify-specialist (specialist principal) (certification-level uint) (specialization (string-ascii 50)))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? specialists { specialist: specialist })) ERR_ALREADY_VERIFIED)
    (map-set specialists
      { specialist: specialist }
      {
        verified: true,
        certification-level: certification-level,
        reputation-score: u100,
        verification-date: block-height,
        specialization: specialization
      }
    )
    (ok true)
  )
)

(define-public (update-reputation (specialist principal) (new-score uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? specialists { specialist: specialist })
      specialist-data
      (begin
        (map-set specialists
          { specialist: specialist }
          (merge specialist-data { reputation-score: new-score })
        )
        (ok true)
      )
      ERR_NOT_FOUND
    )
  )
)

;; Read-only functions
(define-read-only (get-specialist-info (specialist principal))
  (map-get? specialists { specialist: specialist })
)

(define-read-only (is-verified-specialist (specialist principal))
  (match (map-get? specialists { specialist: specialist })
    specialist-data (get verified specialist-data)
    false
  )
)

(define-read-only (get-verification-request (request-id uint))
  (map-get? verification-requests { request-id: request-id })
)
