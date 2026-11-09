# Open Exchange draft — Clinical Evidence Reconciler

**Suggested title:** Clinical Evidence Reconciler — Expert-Informed IBD Evidence Review with IRIS AI Hub

**Short description (for submission):**

Clinical Evidence Reconciler is an open-source, synthetic healthcare interoperability demonstration built on InterSystems IRIS for Health AI Hub. An IRIS Business Service, Business Process and Business Operation invoke a native AI Hub agent with read-only evidence and versioned policy tools. The agent identifies whether a suspected IBD referral packet is complete, missing documentation, or internally inconsistent, returning READY, NEEDS_INFO or REVIEW for human action. Failed agent calls fall back to manual review rather than generating an unsupported clinical decision. The initial version includes three fictional IBD cases and a reproducible ObjectScript demonstration. It does not diagnose disease or process real patient data.

**What makes it relevant:**

Rather than adding an isolated chatbot, the prototype demonstrates how expert-informed clinical evidence requirements can be embedded within an auditable IRIS interoperability workflow. A future product could allow specialists to author, version, approve and deploy such workflows across clinical specialties. Automated protocol authoring and clinical validation are **not** claimed as implemented features.

**Implementation:**

InterSystems IRIS for Health AI Hub (EAP 2027.1 build 109); `%AI.Agent`, `%AI.ToolSet`, `%AI.Tool`; ObjectScript; `Ens.Production`, `Ens.BusinessService`, `Ens.BusinessProcess`, `Ens.BusinessOperation`; synthetic FHIR-inspired evidence JSON; LLM via configured API provider.

**Link to code:** [Replace with public GitHub repository URL]

**Working proof:** All 11 ObjectScript classes compiled with `errs=0`. IRIS AI Hub was invoked through the interoperability production for all three synthetic cases: `IBD-001` → `NEEDS_INFO`, `IBD-002` → `READY`, `IBD-003` → `REVIEW`, each with `AI USED: 1`. The application is a demonstration, not a clinically validated tool.

**Disclaimer:** Demo only; no real patient information, clinical diagnosis or treatment advice.
