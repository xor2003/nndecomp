//class declaration for BANKER'S ALGORITHM
class BANKER
{
  private:
    int no_of_process;  //process involved in snapshot
    int no_of_resource; //resources available
    int *resource;      //instance of each resource available before allocation
    int **allocation;   //allocated resource at present time
    int **maximum;      //maximum need for resource for process
    int **need;         //maximum-allocation matrix
    int *available;     //instance of each resource available after allocation
    int **temp_alloc;   //temporary allocation for checking safestate
    int *complete;      //contain information about finished process

  public:
    BANKER(void); //banker constructor which initialize variable and allocate dynamic memory

    ~BANKER(void); //banker destructor which deallocates the memory and destroy object

    int alloc(void);           //allocate memory dynamically
    int dealloc(void);         //deallocate memory
    int validateDATA(int);     //validate datasheet with algorithm
    void calcDATA(int);        //calcute datasheet for algorithm
    void initDATA(int);        //initialize datasheet for algorithm
    void snapshot(int);        //show current snapshot of process
    int isSAFESTATE(void);     //check for safe state of given snapshot
    void save(void);           //save current safestate
    void restore(void);        //restore to previous safestate
    int requestRES(void);      //to request resource for process and check for deadlock
    void grantREQ(int, int *); //granted request will be added to snapshot of process
    void checkPRO(int);        //check if any process has completed its task and give back resources
    void findSAFESEQ(void);    //find safe sequence to execute process
};