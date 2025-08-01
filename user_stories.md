# User Stories for Neural Network Decompiler Project

## Functional Stories
1. **Title:** Preprocess Source Files  
As a data engineer,  
I want to automatically preprocess C or C++ sources by removing system headers and expanding macroses and typedefs,  
So that the training data is clean and consistent.

2. **Title:** Generate Compiler Artifacts  
As a build engineer,  
I want to convert .CPP files into assembler using various compilers for DOS (Borland, MSC, Turbo),  
So that we have paired source/assembly examples for training.

3. **Title:** Train Decompilation Model  
As an ML researcher,  
I want to train/adapt/prompt a CRNN/Transformers model with compiler input/output pairs,  
So that the model learns to decompile assembly back to C or C++.

4. **Title:** Decompile Assembly Code  
As a reverse engineer,  
I want to input 16-bit x86 assembly and get corresponding C or C++ code,  
So that I can understand legacy binaries without manual decompilation.

5. **Title:** Validate Decompilation Accuracy  
As a quality assurance specialist,  
I want to compare original source with decompiled output,  
So that I can measure the model's accuracy.

## Non-Functional Stories
6. **Title:** Support Multiple Compilers  
As a developer,  
I want the system to handle Borland, MSC and Turbo C++ conventions,  
So that we cover diverse 16-bit compilation patterns.

7. **Title:** Manage Large Datasets  
As a data scientist,  
I want efficient storage for source/assembly pairs,  
So that training pipelines don't get bottlenecked by I/O.

## Technical Stories
8. **Title:** Create Build Pipeline  
As a DevOps engineer,  
I want containerized build environments for each compiler,  
So that compilation is reproducible and isolated.

9. **Title:** Fragment Code for Training  
-As an ML engineer,  
-I want to split source/assembly pairs into function-level samples,  
-So that the model can learn from manageable code units.

## Edge Cases
- Handling compiler-specific optimizations
- Dealing with obfuscated or minified code
- Supporting different memory models (tiny, small, large, etc)
