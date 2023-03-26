; ModuleID = 'src/locale/dcngettext.c'
source_filename = "src/locale/dcngettext.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.msgcat = type { %struct.msgcat*, i8*, i64, i8*, i32, %struct.binding*, %struct.__locale_map*, i32 }
%struct.binding = type { %struct.binding*, i32, i32, i8*, i8*, [0 x i8] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }

@lock = internal global [1 x i32] zeroinitializer, align 4
@__gettext_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0), align 8
@bindings = internal global i8* null, align 8
@dcngettext.cats = internal global %struct.msgcat* null, align 8
@catnames = internal constant [6 x [12 x i8]] [[12 x i8] c"LC_CTYPE\00\00\00\00", [12 x i8] c"LC_NUMERIC\00\00", [12 x i8] c"LC_TIME\00\00\00\00\00", [12 x i8] c"LC_COLLATE\00\00", [12 x i8] c"LC_MONETARY\00", [12 x i8] c"LC_MESSAGES\00"], align 16
@catlens = internal unnamed_addr constant [6 x i8] c"\08\0A\07\0A\0B\0B", align 1
@.str = private unnamed_addr constant [22 x i8] c"%s/%.*s%.*s/%s/%s.mo\00\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"n!=1;\00", align 1
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Plural-Forms:\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"nplurals=\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"plural=\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"messages\00", align 1

@__gettextdomain = weak hidden alias i8* (), i8* ()* @dummy_gettextdomain

; Function Attrs: nounwind optsize strictfp
define i8* @bindtextdomain(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i8* %0, null
  br i1 %3, label %107, label %4

4:                                                ; preds = %2
  %5 = icmp eq i8* %1, null
  br i1 %5, label %6, label %28

6:                                                ; preds = %4
  %7 = load volatile i8*, i8** @bindings, align 8, !tbaa !3
  %8 = icmp eq i8* %7, null
  br i1 %8, label %107, label %9

9:                                                ; preds = %6
  %10 = bitcast i8* %7 to %struct.binding*
  br label %11

11:                                               ; preds = %24, %9
  %12 = phi %struct.binding* [ %26, %24 ], [ %10, %9 ]
  %13 = getelementptr inbounds %struct.binding, %struct.binding* %12, i64 0, i32 3
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  %15 = tail call i32 @strcmp(i8* noundef %14, i8* noundef nonnull %0) #6
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %24

17:                                               ; preds = %11
  %18 = getelementptr inbounds %struct.binding, %struct.binding* %12, i64 0, i32 2
  %19 = load volatile i32, i32* %18, align 4, !tbaa !7
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %24, label %21

21:                                               ; preds = %17
  %22 = getelementptr inbounds %struct.binding, %struct.binding* %12, i64 0, i32 4
  %23 = load i8*, i8** %22, align 8, !tbaa !3
  br label %107

24:                                               ; preds = %17, %11
  %25 = getelementptr inbounds %struct.binding, %struct.binding* %12, i64 0, i32 0
  %26 = load %struct.binding*, %struct.binding** %25, align 8, !tbaa !3
  %27 = icmp eq %struct.binding* %26, null
  br i1 %27, label %107, label %11

28:                                               ; preds = %4
  %29 = tail call i64 @strnlen(i8* noundef nonnull %0, i64 noundef 256) #6
  %30 = tail call i64 @strnlen(i8* noundef nonnull %1, i64 noundef 4096) #6
  %31 = icmp ugt i64 %29, 255
  %32 = icmp ugt i64 %30, 4095
  %33 = select i1 %31, i1 true, i1 %32
  br i1 %33, label %34, label %36

34:                                               ; preds = %28
  %35 = tail call i32* @___errno_location() #7
  store i32 22, i32* %35, align 4, !tbaa !7
  br label %107

36:                                               ; preds = %28
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %37 = load volatile i8*, i8** @bindings, align 8, !tbaa !3
  %38 = icmp eq i8* %37, null
  br i1 %38, label %56, label %39

39:                                               ; preds = %36
  %40 = bitcast i8* %37 to %struct.binding*
  br label %41

41:                                               ; preds = %39, %52
  %42 = phi %struct.binding* [ %54, %52 ], [ %40, %39 ]
  %43 = getelementptr inbounds %struct.binding, %struct.binding* %42, i64 0, i32 3
  %44 = load i8*, i8** %43, align 8, !tbaa !3
  %45 = tail call i32 @strcmp(i8* noundef %44, i8* noundef nonnull %0) #6
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %52

47:                                               ; preds = %41
  %48 = getelementptr inbounds %struct.binding, %struct.binding* %42, i64 0, i32 4
  %49 = load i8*, i8** %48, align 8, !tbaa !3
  %50 = tail call i32 @strcmp(i8* noundef %49, i8* noundef nonnull %1) #6
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %83, label %52

52:                                               ; preds = %41, %47
  %53 = getelementptr inbounds %struct.binding, %struct.binding* %42, i64 0, i32 0
  %54 = load %struct.binding*, %struct.binding** %53, align 8, !tbaa !3
  %55 = icmp eq %struct.binding* %54, null
  br i1 %55, label %56, label %41

56:                                               ; preds = %52, %36
  %57 = add i64 %29, 34
  %58 = add i64 %57, %30
  %59 = tail call i8* @__libc_calloc(i64 noundef %58, i64 noundef 1) #6
  %60 = icmp eq i8* %59, null
  br i1 %60, label %61, label %62

61:                                               ; preds = %56
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  br label %107

62:                                               ; preds = %56
  %63 = bitcast i8* %59 to %struct.binding*
  %64 = load volatile i8*, i8** @bindings, align 8, !tbaa !3
  %65 = bitcast i8* %59 to i8**
  store i8* %64, i8** %65, align 8, !tbaa !3
  %66 = trunc i64 %30 to i32
  %67 = getelementptr inbounds i8, i8* %59, i64 8
  %68 = bitcast i8* %67 to i32*
  store i32 %66, i32* %68, align 8, !tbaa !7
  %69 = getelementptr inbounds i8, i8* %59, i64 32
  %70 = getelementptr inbounds i8, i8* %59, i64 16
  %71 = bitcast i8* %70 to i8**
  store i8* %69, i8** %71, align 8, !tbaa !3
  %72 = getelementptr inbounds i8, i8* %69, i64 %29
  %73 = getelementptr inbounds i8, i8* %72, i64 1
  %74 = getelementptr inbounds i8, i8* %59, i64 24
  %75 = bitcast i8* %74 to i8**
  store i8* %73, i8** %75, align 8, !tbaa !3
  %76 = add i64 %29, 1
  %77 = tail call i8* @memcpy(i8* noundef nonnull %69, i8* noundef nonnull %0, i64 noundef %76) #6
  %78 = load i8*, i8** %75, align 8, !tbaa !3
  %79 = add i64 %30, 1
  %80 = tail call i8* @memcpy(i8* noundef %78, i8* noundef nonnull %1, i64 noundef %79) #6
  %81 = load volatile i8*, i8** @bindings, align 8, !tbaa !3
  %82 = tail call i8* asm "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i8** nonnull elementtype(i8*) @bindings, i8* %81, i8* nonnull %59) #8, !srcloc !9
  br label %83

83:                                               ; preds = %47, %62
  %84 = phi %struct.binding* [ %63, %62 ], [ %42, %47 ]
  %85 = getelementptr inbounds %struct.binding, %struct.binding* %84, i64 0, i32 2
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %85, i32 1) #8, !srcloc !10
  %86 = load volatile i8*, i8** @bindings, align 8, !tbaa !3
  %87 = icmp eq i8* %86, null
  br i1 %87, label %104, label %88

88:                                               ; preds = %83
  %89 = bitcast i8* %86 to %struct.binding*
  br label %90

90:                                               ; preds = %88, %100
  %91 = phi %struct.binding* [ %102, %100 ], [ %89, %88 ]
  %92 = getelementptr inbounds %struct.binding, %struct.binding* %91, i64 0, i32 3
  %93 = load i8*, i8** %92, align 8, !tbaa !3
  %94 = tail call i32 @strcmp(i8* noundef %93, i8* noundef nonnull %0) #6
  %95 = icmp ne i32 %94, 0
  %96 = icmp eq %struct.binding* %91, %84
  %97 = select i1 %95, i1 true, i1 %96
  br i1 %97, label %100, label %98

98:                                               ; preds = %90
  %99 = getelementptr inbounds %struct.binding, %struct.binding* %91, i64 0, i32 2
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %99, i32 0) #8, !srcloc !10
  br label %100

100:                                              ; preds = %90, %98
  %101 = getelementptr inbounds %struct.binding, %struct.binding* %91, i64 0, i32 0
  %102 = load %struct.binding*, %struct.binding** %101, align 8, !tbaa !3
  %103 = icmp eq %struct.binding* %102, null
  br i1 %103, label %104, label %90

104:                                              ; preds = %100, %83
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #6
  %105 = getelementptr inbounds %struct.binding, %struct.binding* %84, i64 0, i32 4
  %106 = load i8*, i8** %105, align 8, !tbaa !3
  br label %107

107:                                              ; preds = %24, %21, %6, %34, %61, %104, %2
  %108 = phi i8* [ null, %2 ], [ null, %34 ], [ %106, %104 ], [ null, %61 ], [ %23, %21 ], [ null, %6 ], [ null, %24 ]
  ret i8* %108
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__libc_calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal i8* @dummy_gettextdomain() #4 {
  ret i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0)
}

; Function Attrs: nounwind optsize strictfp
define i8* @dcngettext(i8* noundef %0, i8* noundef %1, i8* noundef readnone %2, i64 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #9, !srcloc !11
  %9 = inttoptr i64 %8 to %struct.__pthread*
  %10 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 24
  %11 = load %struct.__locale_struct*, %struct.__locale_struct** %10, align 8, !tbaa !12
  %12 = tail call i32* @___errno_location() #7
  %13 = load i32, i32* %12, align 4, !tbaa !7
  %14 = icmp eq i8* %1, null
  %15 = icmp ugt i32 %4, 5
  %16 = or i1 %14, %15
  br i1 %16, label %49, label %17

17:                                               ; preds = %5
  %18 = icmp eq i8* %0, null
  br i1 %18, label %19, label %21

19:                                               ; preds = %17
  %20 = tail call i8* @__gettextdomain() #6
  br label %21

21:                                               ; preds = %19, %17
  %22 = phi i8* [ %0, %17 ], [ %20, %19 ]
  %23 = tail call i64 @strnlen(i8* noundef %22, i64 noundef 256) #6
  %24 = icmp ugt i64 %23, 255
  br i1 %24, label %49, label %25

25:                                               ; preds = %21
  %26 = load volatile i8*, i8** @bindings, align 8, !tbaa !3
  %27 = icmp eq i8* %26, null
  br i1 %27, label %49, label %28

28:                                               ; preds = %25
  %29 = bitcast i8* %26 to %struct.binding*
  br label %30

30:                                               ; preds = %28, %40
  %31 = phi %struct.binding* [ %42, %40 ], [ %29, %28 ]
  %32 = getelementptr inbounds %struct.binding, %struct.binding* %31, i64 0, i32 3
  %33 = load i8*, i8** %32, align 8, !tbaa !3
  %34 = tail call i32 @strcmp(i8* noundef %33, i8* noundef %22) #6
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %40

36:                                               ; preds = %30
  %37 = getelementptr inbounds %struct.binding, %struct.binding* %31, i64 0, i32 2
  %38 = load volatile i32, i32* %37, align 4, !tbaa !7
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %44

40:                                               ; preds = %30, %36
  %41 = getelementptr inbounds %struct.binding, %struct.binding* %31, i64 0, i32 0
  %42 = load %struct.binding*, %struct.binding** %41, align 8, !tbaa !3
  %43 = icmp eq %struct.binding* %42, null
  br i1 %43, label %49, label %30

44:                                               ; preds = %36
  %45 = sext i32 %4 to i64
  %46 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %11, i64 0, i32 0, i64 %45
  %47 = load %struct.__locale_map*, %struct.__locale_map** %46, align 8, !tbaa !3
  %48 = icmp eq %struct.__locale_map* %47, null
  br i1 %48, label %49, label %52

49:                                               ; preds = %40, %240, %25, %229, %213, %215, %44, %21, %5
  store i32 %13, i32* %12, align 4, !tbaa !7
  %50 = icmp eq i64 %3, 1
  %51 = select i1 %50, i8* %1, i8* %2
  br label %254

52:                                               ; preds = %44
  %53 = load volatile %struct.msgcat*, %struct.msgcat** @dcngettext.cats, align 8, !tbaa !3
  %54 = icmp eq %struct.msgcat* %53, null
  br i1 %54, label %72, label %55

55:                                               ; preds = %52, %68
  %56 = phi %struct.msgcat* [ %70, %68 ], [ %53, %52 ]
  %57 = getelementptr inbounds %struct.msgcat, %struct.msgcat* %56, i64 0, i32 5
  %58 = load %struct.binding*, %struct.binding** %57, align 8, !tbaa !16
  %59 = icmp eq %struct.binding* %58, %31
  br i1 %59, label %60, label %68

60:                                               ; preds = %55
  %61 = getelementptr inbounds %struct.msgcat, %struct.msgcat* %56, i64 0, i32 6
  %62 = load %struct.__locale_map*, %struct.__locale_map** %61, align 8, !tbaa !18
  %63 = icmp eq %struct.__locale_map* %62, %47
  br i1 %63, label %64, label %68

64:                                               ; preds = %60
  %65 = getelementptr inbounds %struct.msgcat, %struct.msgcat* %56, i64 0, i32 7
  %66 = load i32, i32* %65, align 8, !tbaa !19
  %67 = icmp eq i32 %66, %4
  br i1 %67, label %215, label %68

68:                                               ; preds = %55, %60, %64
  %69 = getelementptr inbounds %struct.msgcat, %struct.msgcat* %56, i64 0, i32 0
  %70 = load %struct.msgcat*, %struct.msgcat** %69, align 8, !tbaa !20
  %71 = icmp eq %struct.msgcat* %70, null
  br i1 %71, label %72, label %55

72:                                               ; preds = %68, %52
  %73 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %73) #8
  %74 = getelementptr inbounds %struct.binding, %struct.binding* %31, i64 0, i32 4
  %75 = load i8*, i8** %74, align 8, !tbaa !3
  %76 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %47, i64 0, i32 2, i64 0
  %77 = getelementptr inbounds [6 x [12 x i8]], [6 x [12 x i8]]* @catnames, i64 0, i64 %45, i64 0
  %78 = getelementptr inbounds %struct.binding, %struct.binding* %31, i64 0, i32 1
  %79 = load i32, i32* %78, align 8, !tbaa !7
  %80 = sext i32 %79 to i64
  %81 = tail call i64 @strlen(i8* noundef nonnull %76) #6
  %82 = getelementptr inbounds [6 x i8], [6 x i8]* @catlens, i64 0, i64 %45
  %83 = load i8, i8* %82, align 1, !tbaa !21
  %84 = sext i8 %83 to i64
  %85 = tail call i8* @memchr(i8* noundef nonnull %76, i32 noundef 64, i64 noundef %81) #6
  %86 = icmp eq i8* %85, null
  %87 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %47, i64 0, i32 2, i64 %81
  %88 = select i1 %86, i8* %87, i8* %85
  %89 = ptrtoint i8* %88 to i64
  %90 = ptrtoint i8* %76 to i64
  %91 = sub i64 %89, %90
  %92 = sub i64 %81, %91
  %93 = tail call i8* @memchr(i8* noundef nonnull %76, i32 noundef 46, i64 noundef %91) #6
  %94 = icmp eq i8* %93, null
  %95 = ptrtoint i8* %93 to i64
  %96 = sub i64 %95, %90
  %97 = select i1 %94, i64 %91, i64 %96
  %98 = add i64 %23, 7
  %99 = add i64 %98, %80
  %100 = add i64 %99, %84
  %101 = add i64 %100, %97
  %102 = add i64 %101, %92
  %103 = tail call i8* @llvm.stacksave() #10
  %104 = alloca i8, i64 %102, align 16
  %105 = trunc i64 %97 to i32
  %106 = trunc i64 %92 to i32
  %107 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %104, i64 noundef %102, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* noundef %75, i32 noundef %105, i8* noundef nonnull %76, i32 noundef %106, i8* noundef %88, i8* noundef nonnull %77, i8* noundef %22) #6
  %108 = call i8* @__map_file(i8* noundef nonnull %104, i64* noundef nonnull %6) #6
  %109 = icmp eq i8* %108, null
  br i1 %109, label %110, label %128

110:                                              ; preds = %72, %120
  %111 = phi i64 [ %122, %120 ], [ %97, %72 ]
  %112 = phi i64 [ %121, %120 ], [ %92, %72 ]
  %113 = icmp eq i64 %112, 0
  br i1 %113, label %114, label %120

114:                                              ; preds = %110
  %115 = call i8* @memchr(i8* noundef nonnull %76, i32 noundef 95, i64 noundef %111) #6
  %116 = icmp eq i8* %115, null
  br i1 %116, label %213, label %117

117:                                              ; preds = %114
  %118 = ptrtoint i8* %115 to i64
  %119 = sub i64 %118, %90
  br label %120

120:                                              ; preds = %110, %117
  %121 = phi i64 [ %92, %117 ], [ 0, %110 ]
  %122 = phi i64 [ %119, %117 ], [ %111, %110 ]
  %123 = trunc i64 %122 to i32
  %124 = trunc i64 %121 to i32
  %125 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %104, i64 noundef %102, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* noundef %75, i32 noundef %123, i8* noundef nonnull %76, i32 noundef %124, i8* noundef %88, i8* noundef nonnull %77, i8* noundef %22) #6
  %126 = call i8* @__map_file(i8* noundef nonnull %104, i64* noundef nonnull %6) #6
  %127 = icmp eq i8* %126, null
  br i1 %127, label %110, label %128

128:                                              ; preds = %120, %72
  %129 = phi i8* [ %108, %72 ], [ %126, %120 ]
  %130 = call i8* @__libc_calloc(i64 noundef 64, i64 noundef 1) #6
  %131 = bitcast i8* %130 to %struct.msgcat*
  %132 = icmp eq i8* %130, null
  br i1 %132, label %133, label %136

133:                                              ; preds = %128
  %134 = load i64, i64* %6, align 8, !tbaa !22
  %135 = call i32 @__munmap(i8* noundef nonnull %129, i64 noundef %134) #6
  br label %213

136:                                              ; preds = %128
  %137 = getelementptr inbounds i8, i8* %130, i64 56
  %138 = bitcast i8* %137 to i32*
  store i32 %4, i32* %138, align 8, !tbaa !19
  %139 = getelementptr inbounds i8, i8* %130, i64 40
  %140 = bitcast i8* %139 to %struct.binding**
  store %struct.binding* %31, %struct.binding** %140, align 8, !tbaa !16
  %141 = getelementptr inbounds i8, i8* %130, i64 48
  %142 = bitcast i8* %141 to %struct.__locale_map**
  store %struct.__locale_map* %47, %struct.__locale_map** %142, align 8, !tbaa !18
  %143 = getelementptr inbounds i8, i8* %130, i64 8
  %144 = bitcast i8* %143 to i8**
  store i8* %129, i8** %144, align 8, !tbaa !23
  %145 = load i64, i64* %6, align 8, !tbaa !22
  %146 = getelementptr inbounds i8, i8* %130, i64 16
  %147 = bitcast i8* %146 to i64*
  store i64 %145, i64* %147, align 8, !tbaa !24
  %148 = call i8* @__mo_lookup(i8* noundef nonnull %129, i64 noundef %145, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i64 0, i64 0)) #6
  %149 = bitcast i8** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %149) #8
  %150 = icmp eq i8* %148, null
  br i1 %150, label %199, label %151

151:                                              ; preds = %136, %155
  %152 = phi i8* [ %158, %155 ], [ %148, %136 ]
  %153 = call i32 @strncmp(i8* noundef nonnull %152, i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i64 noundef 13) #6
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %159, label %155

155:                                              ; preds = %151
  %156 = call i8* @strchr(i8* noundef nonnull %152, i32 noundef 10) #6
  store i8* %156, i8** %7, align 8, !tbaa !3
  %157 = icmp eq i8* %156, null
  %158 = getelementptr inbounds i8, i8* %156, i64 1
  br i1 %157, label %199, label %151

159:                                              ; preds = %151
  %160 = getelementptr inbounds i8, i8* %152, i64 13
  br label %161

161:                                              ; preds = %161, %159
  %162 = phi i8* [ %160, %159 ], [ %169, %161 ]
  %163 = load i8, i8* %162, align 1, !tbaa !21
  %164 = sext i8 %163 to i32
  %165 = icmp ne i8 %163, 32
  %166 = add nsw i32 %164, -14
  %167 = icmp ult i32 %166, -5
  %168 = and i1 %165, %167
  %169 = getelementptr inbounds i8, i8* %162, i64 1
  br i1 %168, label %170, label %161

170:                                              ; preds = %161
  %171 = call i32 @strncmp(i8* noundef nonnull %162, i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64 noundef 9) #6
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %173, label %177

173:                                              ; preds = %170
  %174 = getelementptr inbounds i8, i8* %162, i64 9
  %175 = call i64 @strtoul(i8* noundef nonnull %174, i8** noundef nonnull %7, i32 noundef 10) #6
  %176 = load i8*, i8** %7, align 8, !tbaa !3
  br label %177

177:                                              ; preds = %173, %170
  %178 = phi i64 [ 2, %170 ], [ %175, %173 ]
  %179 = phi i8* [ %162, %170 ], [ %176, %173 ]
  br label %180

180:                                              ; preds = %183, %177
  %181 = phi i8* [ %179, %177 ], [ %184, %183 ]
  %182 = load i8, i8* %181, align 1, !tbaa !21
  switch i8 %182, label %183 [
    i8 0, label %199
    i8 59, label %185
  ]

183:                                              ; preds = %180
  %184 = getelementptr inbounds i8, i8* %181, i64 1
  br label %180

185:                                              ; preds = %180, %185
  %186 = phi i8* [ %187, %185 ], [ %181, %180 ]
  %187 = getelementptr inbounds i8, i8* %186, i64 1
  %188 = load i8, i8* %187, align 1, !tbaa !21
  %189 = sext i8 %188 to i32
  %190 = icmp ne i8 %188, 32
  %191 = add nsw i32 %189, -14
  %192 = icmp ult i32 %191, -5
  %193 = and i1 %190, %192
  br i1 %193, label %194, label %185

194:                                              ; preds = %185
  %195 = call i32 @strncmp(i8* noundef nonnull %187, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i64 noundef 7) #6
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %197, label %199

197:                                              ; preds = %194
  %198 = getelementptr inbounds i8, i8* %186, i64 8
  br label %199

199:                                              ; preds = %155, %180, %136, %197, %194
  %200 = phi i8* [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), %194 ], [ %198, %197 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), %136 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), %180 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), %155 ]
  %201 = phi i64 [ %178, %194 ], [ %178, %197 ], [ 2, %136 ], [ %178, %180 ], [ 2, %155 ]
  %202 = trunc i64 %201 to i32
  %203 = getelementptr inbounds i8, i8* %130, i64 32
  %204 = bitcast i8* %203 to i32*
  store i32 %202, i32* %204, align 8, !tbaa !25
  %205 = getelementptr inbounds i8, i8* %130, i64 24
  %206 = bitcast i8* %205 to i8**
  store i8* %200, i8** %206, align 8, !tbaa !26
  %207 = bitcast i8* %130 to %struct.msgcat**
  br label %208

208:                                              ; preds = %208, %199
  %209 = load volatile %struct.msgcat*, %struct.msgcat** @dcngettext.cats, align 8, !tbaa !3
  %210 = bitcast %struct.msgcat* %209 to i8*
  store %struct.msgcat* %209, %struct.msgcat** %207, align 8, !tbaa !20
  %211 = call i8* asm "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i8** elementtype(i8*) bitcast (%struct.msgcat** @dcngettext.cats to i8**), i8* %210, i8* nonnull %130) #8, !srcloc !9
  %212 = icmp eq i8* %211, %210
  br i1 %212, label %214, label %208

213:                                              ; preds = %114, %133
  call void @llvm.stackrestore(i8* %103) #10
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %73) #8
  br label %49

214:                                              ; preds = %208
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %149) #8
  call void @llvm.stackrestore(i8* %103) #10
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %73) #8
  br label %215

215:                                              ; preds = %64, %214
  %216 = phi %struct.msgcat* [ %131, %214 ], [ %56, %64 ]
  %217 = getelementptr inbounds %struct.msgcat, %struct.msgcat* %216, i64 0, i32 1
  %218 = load i8*, i8** %217, align 8, !tbaa !23
  %219 = getelementptr inbounds %struct.msgcat, %struct.msgcat* %216, i64 0, i32 2
  %220 = load i64, i64* %219, align 8, !tbaa !24
  %221 = call i8* @__mo_lookup(i8* noundef %218, i64 noundef %220, i8* noundef %1) #6
  %222 = icmp eq i8* %221, null
  br i1 %222, label %49, label %223

223:                                              ; preds = %215
  %224 = icmp eq i8* %2, null
  br i1 %224, label %252, label %225

225:                                              ; preds = %223
  %226 = getelementptr inbounds %struct.msgcat, %struct.msgcat* %216, i64 0, i32 4
  %227 = load i32, i32* %226, align 8, !tbaa !25
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %252, label %229

229:                                              ; preds = %225
  %230 = getelementptr inbounds %struct.msgcat, %struct.msgcat* %216, i64 0, i32 3
  %231 = load i8*, i8** %230, align 8, !tbaa !26
  %232 = call i64 @__pleval(i8* noundef %231, i64 noundef %3) #6
  %233 = load i32, i32* %226, align 8, !tbaa !25
  %234 = sext i32 %233 to i64
  %235 = icmp ugt i64 %232, %234
  br i1 %235, label %49, label %236

236:                                              ; preds = %229, %240
  %237 = phi i8* [ %251, %240 ], [ %221, %229 ]
  %238 = phi i64 [ %241, %240 ], [ %232, %229 ]
  %239 = icmp eq i64 %238, 0
  br i1 %239, label %252, label %240

240:                                              ; preds = %236
  %241 = add i64 %238, -1
  %242 = load i64, i64* %219, align 8, !tbaa !24
  %243 = load i8*, i8** %217, align 8, !tbaa !23
  %244 = ptrtoint i8* %237 to i64
  %245 = ptrtoint i8* %243 to i64
  %246 = sub i64 %245, %244
  %247 = add i64 %246, %242
  %248 = call i64 @strnlen(i8* noundef %237, i64 noundef %247) #6
  %249 = add i64 %248, 1
  %250 = icmp ult i64 %249, %247
  %251 = getelementptr inbounds i8, i8* %237, i64 %249
  br i1 %250, label %236, label %49

252:                                              ; preds = %236, %225, %223
  %253 = phi i8* [ %221, %225 ], [ %221, %223 ], [ %237, %236 ]
  store i32 %13, i32* %12, align 4, !tbaa !7
  br label %254

254:                                              ; preds = %252, %49
  %255 = phi i8* [ %51, %49 ], [ %253, %252 ]
  ret i8* %255
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memchr(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare i8* @llvm.stacksave() #5

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__map_file(i8* noundef, i64* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__munmap(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__mo_lookup(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #5

; Function Attrs: optsize
declare hidden i64 @__pleval(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define i8* @dcgettext(i8* noundef %0, i8* noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call i8* @dcngettext(i8* noundef %0, i8* noundef %1, i8* noundef null, i64 noundef 1, i32 noundef %2) #11
  ret i8* %4
}

; Function Attrs: nounwind optsize strictfp
define i8* @dngettext(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = tail call i8* @dcngettext(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64 noundef %3, i32 noundef 5) #11
  ret i8* %5
}

; Function Attrs: nounwind optsize strictfp
define i8* @dgettext(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i8* @dcngettext(i8* noundef %0, i8* noundef %1, i8* noundef null, i64 noundef 1, i32 noundef 5) #11
  ret i8* %3
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nosync nounwind willreturn }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nounwind strictfp }
attributes #9 = { nounwind readnone strictfp }
attributes #10 = { strictfp }
attributes #11 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{i64 296691}
!10 = !{i64 298210}
!11 = !{i64 299524}
!12 = !{!13, !4, i64 168}
!13 = !{!"__pthread", !4, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !14, i64 32, !14, i64 40, !8, i64 48, !8, i64 52, !8, i64 56, !8, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !4, i64 72, !14, i64 80, !4, i64 88, !14, i64 96, !14, i64 104, !4, i64 112, !4, i64 120, !4, i64 128, !15, i64 136, !8, i64 160, !8, i64 164, !4, i64 168, !5, i64 176, !4, i64 184, !4, i64 192}
!14 = !{!"long", !5, i64 0}
!15 = !{!"", !4, i64 0, !14, i64 8, !4, i64 16}
!16 = !{!17, !4, i64 40}
!17 = !{!"msgcat", !4, i64 0, !4, i64 8, !14, i64 16, !4, i64 24, !8, i64 32, !4, i64 40, !4, i64 48, !8, i64 56}
!18 = !{!17, !4, i64 48}
!19 = !{!17, !8, i64 56}
!20 = !{!17, !4, i64 0}
!21 = !{!5, !5, i64 0}
!22 = !{!14, !14, i64 0}
!23 = !{!17, !4, i64 8}
!24 = !{!17, !14, i64 16}
!25 = !{!17, !8, i64 32}
!26 = !{!17, !4, i64 24}
