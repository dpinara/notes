## Threading..

### This is how runnable is returned. See no mentioning of run, just method return time decides

    '''
    private static Runnable getRunnable() {
            return () -> {
                try {
                    TimeUnit.SECONDS.sleep(5);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                String threadName = Thread.currentThread().getName();
                System.out.println("Hello " + threadName);
            };
        }
    '''
    